CKPT_DIR=${1:-"/results/SSD320_FP32_1GPU"}
PIPELINE_CONFIG_PATH=${2:-"/workdir/models/research/configs"}"/ssd320_full_1gpus.config"

TENSOR_OPS=0
export TF_ENABLE_CUBLAS_TENSOR_OP_MATH_FP32=${TENSOR_OPS}
export TF_ENABLE_CUDNN_TENSOR_OP_MATH_FP32=${TENSOR_OPS}
export TF_ENABLE_CUDNN_RNN_TENSOR_OP_MATH_FP32=${TENSOR_OPS}

time python -u ./object_detection/model_main.py \
       --pipeline_config_path=${PIPELINE_CONFIG_PATH} \
       --model_dir=${CKPT_DIR} \
       --alsologtostder \
       "${@:3}"
