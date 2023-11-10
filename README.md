# Welcome, this page is auxiliary for the paper: "Is your code harmful too? Understanding harmful code through transfer learning", here we display the results as well provide the datasets used.

## Installation Guide:

- pip install -r requirements.txt

## Study Design:
![mestrado-study design](https://github.com/orestesmkb/transfer_learning_replication_package/assets/56333638/b47ec914-b374-4bac-9812-5843738c54ae)

## Harmful Code results for the transfer learning combined for all code smells and divided by each language:
![model_C#_perceptron1_16_ma_dataset_C++_MultifacetedAbstraction_Test_1 csv](https://github.com/orestesmkb/transfer_learning_replication_package/assets/56333638/b7d8b916-b2aa-420c-a27e-7c1af792bcd3) ![model_C#_perceptron1_512_cm_dataset_Java_ComplexMethod_Test_1 csv](https://github.com/orestesmkb/transfer_learning_replication_package/assets/56333638/4b3bc1a1-9e52-4c28-8689-da4c3fca2a1d)

![model_C++_perceptron1_4_cm_dataset_Java_ComplexMethod_Test_1 csv](https://github.com/orestesmkb/transfer_learning_replication_package/assets/56333638/7fc2df06-961f-44ae-bd15-c552668f1bfc) ![model_C++_perceptron1_512_im_dataset_C#_InsufficientModularization_Test_1 csv](https://github.com/orestesmkb/transfer_learning_replication_package/assets/56333638/56d9b9e8-bbc5-4cd7-883d-32c2db0f2950)

![model_Java_perceptron1_128_cm_dataset_C++_ComplexMethod_Test_1 csv](https://github.com/orestesmkb/transfer_learning_replication_package/assets/56333638/07e2268a-1e35-469e-a86f-06b9b4ba05a9) ![model_Java_perceptron1_512_im_dataset_C#_InsufficientModularization_Test_1 csv](https://github.com/orestesmkb/transfer_learning_replication_package/assets/56333638/07344449-86a8-4049-8954-9a8ac626ff94)

## main.py script:
In this repository, the main file opens a "project_patches.csv", with the following header "project,commit,file_path,patch", 
and compares its data with a local PostgreSQL database. It checks if the file path from the csv is contained within the database, 
if so it verifies if there are any smells in the code and saves a jsonb to the database, then it checks if the line number 
from that class and its methods are contained in the hunk intervals from the csv patch, marking it in the database as a bug fix.

##  get_tokens_csv.py script:
This script generates temporary files, based on a csv file, to generate tokens from the code text, it requires [tokenizer](https://github.com/dspinellis/tokenizer) to run.

## make_tokenizer_csv.py script:
This script will get all relevant data from the PostgreSQL database and save it in a csv file. This was necessary to run the
get_tokens.py script in a Linux virtual machine.

## make_train_test.py script:
This script receives a csv file and, for each language and code smell, it does an 80/20 split, creating train and test files.

## plot_test.py script:
This script has all the code needed to run transfer-learning-experiments, however only the RQ3: Plot function is not commented.
