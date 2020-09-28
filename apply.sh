#!/bin/bash

terraform plan -out test.tfplan
terraform apply test.tfplan
