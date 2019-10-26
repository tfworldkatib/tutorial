# Hyperparameter Tuning

Katib has an extensible architecture for `Suggestion` algorithms. Today we will look at four of the in-built models.

Let us start with the `random` algorithm using a TensorFlow Job example.

```console
cd $HOME/tutorial/setup/katib/examples/v1alpha3
kubectl apply -f tfjob-example.yaml
 ```
 <details>
<summary>
 Sample Output
 </summary>
experiment.kubeflow.org/tfjob-example created
</details>

Check that the `Experiment` **tfjob-example** has started.

 ```console
kubectl -n kubeflow get experiment
 ```

<details>
<summary>
 Sample Output
 </summary>
NAME            STATUS    AGE
tfjob-example   Running   98s
</details>

Check the details of the `Experiment` **tfjob-example**

 ```console
kubectl -n kubeflow get experiment tfjob-example -o json
 ```

<details>
<summary>
 Sample Output
 </summary>
{
    "apiVersion": "kubeflow.org/v1alpha3",
    "kind": "Experiment",
    "metadata": {
        "annotations": {
            "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"kubeflow.org/v1alpha3\",\"kind\":\"Experiment\",\"metadata\":{\"annotations\":{},\"name\":\"tfjob-example\",\"namespace\":\"kubeflow\"},\"spec\":{\"algorithm\":{\"algorithmName\":\"random\"},\"maxFailedTrialCount\":3,\"maxTrialCount\":12,\"metricsCollectorSpec\":{\"collector\":{\"kind\":\"TensorFlowEvent\"},\"source\":{\"fileSystemPath\":{\"kind\":\"Directory\",\"path\":\"/train\"}}},\"objective\":{\"goal\":0.99,\"objectiveMetricName\":\"accuracy_1\",\"type\":\"maximize\"},\"parallelTrialCount\":3,\"parameters\":[{\"feasibleSpace\":{\"max\":\"0.05\",\"min\":\"0.01\"},\"name\":\"--learning_rate\",\"parameterType\":\"double\"},{\"feasibleSpace\":{\"max\":\"200\",\"min\":\"100\"},\"name\":\"--batch_size\",\"parameterType\":\"int\"}],\"trialTemplate\":{\"goTemplate\":{\"rawTemplate\":\"apiVersion: \\\"kubeflow.org/v1\\\"\\nkind: TFJob\\nmetadata:\\n  name: {{.Trial}}\\n  namespace: {{.NameSpace}}\\nspec:\\n tfReplicaSpecs:\\n  Worker:\\n    replicas: 1 \\n    restartPolicy: OnFailure\\n    template:\\n      spec:\\n        containers:\\n          - name: tensorflow \\n            image: gcr.io/kubeflow-ci/tf-mnist-with-summaries:1.0\\n            imagePullPolicy: IfNotPresent\\n            command:\\n              - \\\"python\\\"\\n              - \\\"/var/tf_mnist/mnist_with_summaries.py\\\"\\n              - \\\"--log_dir=/train/metrics\\\"\\n              {{- with .HyperParameters}}\\n              {{- range .}}\\n              - \\\"{{.Name}}={{.Value}}\\\"\\n              {{- end}}\\n              {{- end}}\"}}}}\n"
        },
        "creationTimestamp": "2019-10-20T07:03:52Z",
        "finalizers": [
            "update-prometheus-metrics"
        ],
        "generation": 2,
        "name": "tfjob-example",
        "namespace": "kubeflow",
        "resourceVersion": "2219",
        "selfLink": "/apis/kubeflow.org/v1alpha3/namespaces/kubeflow/experiments/tfjob-example",
        "uid": "c5e3cdb3-f307-11e9-b489-080027c5bc64"
    },
    "spec": {
        "algorithm": {
            "algorithmName": "random",
            "algorithmSettings": null
        },
        "maxFailedTrialCount": 3,
        "maxTrialCount": 12,
        "metricsCollectorSpec": {
            "collector": {
                "kind": "TensorFlowEvent"
            },
            "source": {
                "fileSystemPath": {
                    "kind": "Directory",
                    "path": "/train"
                }
            }
        },
        "objective": {
            "goal": 0.99,
            "objectiveMetricName": "accuracy_1",
            "type": "maximize"
        },
        "parallelTrialCount": 3,
        "parameters": [
            {
                "feasibleSpace": {
                    "max": "0.05",
                    "min": "0.01"
                },
                "name": "--learning_rate",
                "parameterType": "double"
            },
            {
                "feasibleSpace": {
                    "max": "200",
                    "min": "100"
                },
                "name": "--batch_size",
                "parameterType": "int"
            }
        ],
        "trialTemplate": {
            "goTemplate": {
                "rawTemplate": "apiVersion: \"kubeflow.org/v1\"\nkind: TFJob\nmetadata:\n  name: {{.Trial}}\n  namespace: {{.NameSpace}}\nspec:\n tfReplicaSpecs:\n  Worker:\n    replicas: 1 \n    restartPolicy: OnFailure\n    template:\n      spec:\n        containers:\n          - name: tensorflow \n            image: gcr.io/kubeflow-ci/tf-mnist-with-summaries:1.0\n            imagePullPolicy: IfNotPresent\n            command:\n              - \"python\"\n              - \"/var/tf_mnist/mnist_with_summaries.py\"\n              - \"--log_dir=/train/metrics\"\n              {{- with .HyperParameters}}\n              {{- range .}}\n              - \"{{.Name}}={{.Value}}\"\n              {{- end}}\n              {{- end}}"
            }
        }
    },
    "status": {
        "conditions": [
            {
                "lastTransitionTime": "2019-10-20T07:03:52Z",
                "lastUpdateTime": "2019-10-20T07:03:52Z",
                "message": "Experiment is created",
                "reason": "ExperimentCreated",
                "status": "True",
                "type": "Created"
            },
            {
                "lastTransitionTime": "2019-10-20T07:05:06Z",
                "lastUpdateTime": "2019-10-20T07:05:06Z",
                "message": "Experiment is running",
                "reason": "ExperimentRunning",
                "status": "True",
                "type": "Running"
            }
        ],
        "currentOptimalTrial": {
            "observation": {
                "metrics": null
            },
            "parameterAssignments": null
        },
        "startTime": "2019-10-20T07:03:52Z",
        "trials": 3,
        "trialsPending": 3
    }
}
</details>

You can see Katib creating multiple `Trial` worker pods.
 ```console
kubectl -n kubeflow get pods
```

<details>
<summary>
 Sample Output
 </summary>
NAME                                    READY   STATUS    RESTARTS   AGE
katib-controller-7665868558-nfghw       1/1     Running   1          6m6s
katib-db-594756f779-dxttq               1/1     Running   0          6m7s
katib-manager-769b7bcbfb-7vvgx          1/1     Running   0          6m7s
katib-ui-854969c97-tl4wg                1/1     Running   0          6m5s
pytorch-operator-794899d49b-ww59g       1/1     Running   0          6m5s
tf-job-operator-7b589f5f5f-fpr2p        1/1     Running   0          6m6s
tfjob-example-random-6d68b59ccd-fcn8f   0/1     Running   0          11s
tfjob-example-random-6d68b59ccd-fcn8f   1/1     Running   0          13s
tfjob-example-gr6st2jc-worker-0         0/2     Pending   0          0s
tfjob-example-gr6st2jc-worker-0         0/2     Pending   0          0s
tfjob-example-gr6st2jc-worker-0         0/2     ContainerCreating   0          1s
tfjob-example-8n8xn9kx-worker-0         0/2     Pending             0          0s
tfjob-example-8n8xn9kx-worker-0         0/2     Pending             0          0s
tfjob-example-8n8xn9kx-worker-0         0/2     ContainerCreating   0          1s
tfjob-example-snjtzpc9-worker-0         0/2     Pending             0          0s
tfjob-example-snjtzpc9-worker-0         0/2     Pending             0          1s
tfjob-example-snjtzpc9-worker-0         0/2     ContainerCreating   0          1s
tfjob-example-gr6st2jc-worker-0         2/2     Running             0          4s
tfjob-example-8n8xn9kx-worker-0         2/2     Running             0          6s
tfjob-example-snjtzpc9-worker-0         2/2     Running             0          5s
</details>

This step takes about 10-15 mins to complete. Your Vagrant VM will likely be very busy at this time.
Please do not try to run multiple experiments on this simultaneously.

Check the completion status of the `Experiment` **tfjob-example**

 ```console
kubectl -n kubeflow get experiment tfjob-example -o json
 ```

<details>
<summary>
 Sample Output
 </summary>
 {
    "apiVersion": "kubeflow.org/v1alpha3",
    "kind": "Experiment",
    "metadata": {
        "annotations": {
            "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"kubeflow.org/v1alpha3\",\"kind\":\"Experiment\",\"metadata\":{\"annotations\":{},\"name\":\"tfjob-example\",\"namespace\":\"kubeflow\"},\"spec\":{\"algorithm\":{\"algorithmName\":\"random\"},\"maxFailedTrialCount\":3,\"maxTrialCount\":12,\"metricsCollectorSpec\":{\"collector\":{\"kind\":\"TensorFlowEvent\"},\"source\":{\"fileSystemPath\":{\"kind\":\"Directory\",\"path\":\"/train\"}}},\"objective\":{\"goal\":0.99,\"objectiveMetricName\":\"accuracy_1\",\"type\":\"maximize\"},\"parallelTrialCount\":3,\"parameters\":[{\"feasibleSpace\":{\"max\":\"0.05\",\"min\":\"0.01\"},\"name\":\"--learning_rate\",\"parameterType\":\"double\"},{\"feasibleSpace\":{\"max\":\"200\",\"min\":\"100\"},\"name\":\"--batch_size\",\"parameterType\":\"int\"}],\"trialTemplate\":{\"goTemplate\":{\"rawTemplate\":\"apiVersion: \\\"kubeflow.org/v1\\\"\\nkind: TFJob\\nmetadata:\\n  name: {{.Trial}}\\n  namespace: {{.NameSpace}}\\nspec:\\n tfReplicaSpecs:\\n  Worker:\\n    replicas: 1 \\n    restartPolicy: OnFailure\\n    template:\\n      spec:\\n        containers:\\n          - name: tensorflow \\n            image: gcr.io/kubeflow-ci/tf-mnist-with-summaries:1.0\\n            imagePullPolicy: IfNotPresent\\n            command:\\n              - \\\"python\\\"\\n              - \\\"/var/tf_mnist/mnist_with_summaries.py\\\"\\n              - \\\"--log_dir=/train/metrics\\\"\\n              {{- with .HyperParameters}}\\n              {{- range .}}\\n              - \\\"{{.Name}}={{.Value}}\\\"\\n              {{- end}}\\n              {{- end}}\"}}}}\n"
        },
        "creationTimestamp": "2019-10-20T07:03:52Z",
        "finalizers": [
            "update-prometheus-metrics"
        ],
        "generation": 2,
        "name": "tfjob-example",
        "namespace": "kubeflow",
        "resourceVersion": "3763",
        "selfLink": "/apis/kubeflow.org/v1alpha3/namespaces/kubeflow/experiments/tfjob-example",
        "uid": "c5e3cdb3-f307-11e9-b489-080027c5bc64"
    },
    "spec": {
        "algorithm": {
            "algorithmName": "random",
            "algorithmSettings": null
        },
        "maxFailedTrialCount": 3,
        "maxTrialCount": 12,
        "metricsCollectorSpec": {
            "collector": {
                "kind": "TensorFlowEvent"
            },
            "source": {
                "fileSystemPath": {
                    "kind": "Directory",
                    "path": "/train"
                }
            }
        },
        "objective": {
            "goal": 0.99,
            "objectiveMetricName": "accuracy_1",
            "type": "maximize"
        },
        "parallelTrialCount": 3,
        "parameters": [
            {
                "feasibleSpace": {
                    "max": "0.05",
                    "min": "0.01"
                },
                "name": "--learning_rate",
                "parameterType": "double"
            },
            {
                "feasibleSpace": {
                    "max": "200",
                    "min": "100"
                },
                "name": "--batch_size",
                "parameterType": "int"
            }
        ],
        "trialTemplate": {
            "goTemplate": {
                "rawTemplate": "apiVersion: \"kubeflow.org/v1\"\nkind: TFJob\nmetadata:\n  name: {{.Trial}}\n  namespace: {{.NameSpace}}\nspec:\n tfReplicaSpecs:\n  Worker:\n    replicas: 1 \n    restartPolicy: OnFailure\n    template:\n      spec:\n        containers:\n          - name: tensorflow \n            image: gcr.io/kubeflow-ci/tf-mnist-with-summaries:1.0\n            imagePullPolicy: IfNotPresent\n            command:\n              - \"python\"\n              - \"/var/tf_mnist/mnist_with_summaries.py\"\n              - \"--log_dir=/train/metrics\"\n              {{- with .HyperParameters}}\n              {{- range .}}\n              - \"{{.Name}}={{.Value}}\"\n              {{- end}}\n              {{- end}}"
            }
        }
    },
    "status": {
        "completionTime": "2019-10-20T07:12:19Z",
        "conditions": [
            {
                "lastTransitionTime": "2019-10-20T07:03:52Z",
                "lastUpdateTime": "2019-10-20T07:03:52Z",
                "message": "Experiment is created",
                "reason": "ExperimentCreated",
                "status": "True",
                "type": "Created"
            },
            {
                "lastTransitionTime": "2019-10-20T07:12:19Z",
                "lastUpdateTime": "2019-10-20T07:12:19Z",
                "message": "Experiment is running",
                "reason": "ExperimentRunning",
                "status": "False",
                "type": "Running"
            },
            {
                "lastTransitionTime": "2019-10-20T07:12:19Z",
                "lastUpdateTime": "2019-10-20T07:12:19Z",
                "message": "Experiment has succeeded because max trial count has reached",
                "reason": "ExperimentSucceeded",
                "status": "True",
                "type": "Succeeded"
            }
        ],
        "currentOptimalTrial": {
            "observation": {
                "metrics": [
                    {
                        "name": "accuracy_1",
                        "value": 0.965399980545
                    }
                ]
            },
            "parameterAssignments": [
                {
                    "name": "--learning_rate",
                    "value": "0.01994432506474382"
                },
                {
                    "name": "--batch_size",
                    "value": "182"
                }
            ]
        },
        "startTime": "2019-10-20T07:03:52Z",
        "trials": 12,
        "trialsSucceeded": 12
    }
}
 </details>

 You can observe the status of this experiment under the `status` field of the output.

 You can also see that Katib has cleaned up the `Trial` worker pods.
 ```console
kubectl -n kubeflow get pods
```

<details>
<summary>
 Sample Output
 </summary>
 NAME                                    READY   STATUS    RESTARTS   AGE
katib-controller-7665868558-nfghw       1/1     Running   1          21m
katib-db-594756f779-dxttq               1/1     Running   0          21m
katib-manager-769b7bcbfb-7vvgx          1/1     Running   0          21m
katib-ui-854969c97-tl4wg                1/1     Running   0          21m
pytorch-operator-794899d49b-ww59g       1/1     Running   0          21m
tf-job-operator-7b589f5f5f-fpr2p        1/1     Running   0          21m
tfjob-example-random-6d68b59ccd-fcn8f   1/1     Running   0          15m
</details>