# Kubeflow Pipelines

Install a Python 3.x environment.

<details>
<summary>
Instructions for Linux
</summary>

Download pre-requisites
```console
sudo apt-get update; sudo apt-get install -y curl bzip2
 ```
Install Miniconda

```console
curl -L -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
 ```

Restart your terminal session.

Verify that conda is added to your path.

```console
which conda
```
<details>
<summary>
Sample Output
</summary>


/home/ubuntu/miniconda3/bin/conda

</details>

</details>

Create a new Python 3 environment

```console
conda create --name mlpipeline python=3.7
```

Activate the new enviroment.

```console
conda activate mlpipeline
```

Install Kubeflow Pipelines SDK

```console
pip install \
    https://storage.googleapis.com/ml-pipeline/release/latest/kfp.tar.gz --upgrade
```

