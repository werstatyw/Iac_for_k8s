echo "let's first devine variables for this job"
deployment_name=prometheus-alertmanager
namespace=monitoring
file_name=volume_snapshot_alertmanager.yaml
kubectl scale deployment $deployment_name -n $namespace --replicas=0
echo "then let's apply our volume snapshot for the selected pvc"
kubectl apply -f $file_name
echo "next, lets check if volumesnapshot created correctly with content and by itself: "
kubectl describe volumesnapshot prometheusalertmanager-snapshot -n monitoring
echo "here, please take a look at the Status - Creation Time, and if Ready to use = true :"
kubectl describe volumesnapshotcontent -n monitoring
echo "then we are creating a backup of the existing pvc in order to have a possibility to restore it"
kubectl get pvc prometherus-alertmanager -n monitoring -o yaml > original_alertmanager_pvc.yaml
echo "and now let's create a second pvc with a different name and re-route deployment there: "
kubectl apply -f new_pvc_for_using_snapshot_data.yaml
kubectl edit deployment prometheus-alertmanager -n monitoring
#and change there pvc to the new name.
echo "let's start and test new pvc: "
kubectl scale deployment $deployment_name -n $namespace --replicas=1
echo "don't forget to check logs for pods and how is it working: "
kubectl logs deployment $deployment_name
echo "if everything looks okay, we need to remove original pvc with and re-apply new one with original name: "
kubectl scale deployment $deployment_name -n $namespace --replicas=0
kubectl delete pvc prometheus-alertmanager prometheus-alertmanager2 -n monitoring
kubectl apply -f new_pvc_for_using_snapshot_data.yaml
kubectl scale deployment $deployment_name -n $namespace --replicas=1
echo "that's it, procedure mostly finished! congratulations! "