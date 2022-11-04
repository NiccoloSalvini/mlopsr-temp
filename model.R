library(vetiver)
library(pins)

# prep on a different file ()


# set up model
mod = lm(mpg ~., data = mtcars)


# train on sagemaker
v = vetiver_model(mod, model_name = "model_example")
## manually add paws.storage for now
v$metadata$required_pkgs <- c(v$metadata$required_pkgs, "paws.storage")


# setup pins board
board = board_s3(bucket = "model-artifacts-dump", region = "eu-south-1")
vetiver_pin_write(board, v)

# dev
vetiver_write_plumber(board, name = "model_example", file = "plumber.R")
vetiver_write_docker(v)


## docker
