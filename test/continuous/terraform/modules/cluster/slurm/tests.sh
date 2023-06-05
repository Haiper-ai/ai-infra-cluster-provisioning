. ./test/helpers.sh

slurm::src_dir () {
    echo "${PWD}/terraform/modules/cluster/slurm"
}

slurm::input_dir () {
    echo "${PWD}/test/continuous/terraform/modules/cluster/slurm/input"
}

test::terraform::slurm () {
    helpers::terraform_init "$(slurm::src_dir)"
}

test::terraform::slurm::simple () {
    local -r tfvars=$(mktemp)
    local success=true
    helpers::append_tfvars "$(slurm::input_dir)/simple.tfvars" >"${tfvars}"

    ./scripts/entrypoint.sh create slurm "${tfvars}" || success=false
    ./scripts/entrypoint.sh destroy slurm "${tfvars}" || success=false

    [ "${success}" = true ]
}
