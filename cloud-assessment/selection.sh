#!/bin/bash

get_menu(){
        clear
        echo "
                Cloud Assessment Suite v0.1.0 
                Created by ShyanJMC (Joaquin Manuel Crespo) 

Specify the number of your choice:
[0] - Configure Amazon Web Serivces CLI 
[1] - Configure Microsoft Azure CLI 
[2] - Configure Google Cloud Platform CLI 
[3] - Audit AWS
[4] - Audit Azure
[5] - Audit GCP
[6] - BASH shell

Remember have Read only access in cloud's IAM.
        "
}

configure_aws(){
	echo "AWS CLI needs AccessKey & SecretKey"
	aws configure
	main
}

configure_azure(){
	echo "Using Azure Legacy authentication"
	az login --use-device-code
	main
}

configure_gcp(){
	echo "Configuring gcloud"
	gcloud init
	main
}

audit_aws(){
	echo "Auditing AWS and saving it into /data/[date]"
	prowler aws --output-formats html --output-directory /data/aws/$(date '+%Y-%m-%d_%H-%M')-prowler
	scout aws --no-browser --max-workers 20  --report-dir /data/aws/$(date '+%Y-%m-%d_%H-%M')-scout --result-format json 

	echo "Getting information from AWS Security Hub"
	echo "Take under consideration that AWS Security Hub needs AWS Config enabled with 'Conformance Packs' enabled"
	echo "The service can take some hours to provide information from first enable"
	mkdir -p /data/aws/$(date '+%Y-%m-%d_%H-%M')-metahub && cd /data/aws/$(date '+%Y-%m-%d_%H-%M')-metahub
	/opt/metahub-2.5.0/metahub --sh-profile default --output-modes html

	cd /opt/electriceye -t AWS -o html
	mkdir /data/aws/electriceye-$(date '+%Y-%m-%d_%H-%M') && mv eeauditor/processor/outputs/output_executive_report.html /data/aws/electriceye-$(date '+%Y-%m-%d_%H-%M')
}

audit_azure(){
	echo "Auditing Azure and saving it into /data/[date]"
	prowler azure --az-cli-auth --output-formats html --output-directory /data/azure/$(date '+%Y-%m-%d_%H-%M')-prowler
    scout azure --cli --no-browser --max-workers 20 --all-subscriptions --report-dir /data/azure/$(date '+%Y-%m-%d_%H-%M')-scout --result-format json --skip securitycenter
	# Working on cloud sploit
	# cp config_example.js config.js && <
    # /opt/cloudsploit-3.5.0/

    #cd /opt/electriceye -t
}

audit_gcp(){
	echo "Auditing GCP and saving it into /data/[date]"
}

main(){
        get_menu
        mkdir -p /data/{aws,azure,gcp}
        read -p "Selección: " selection

        echo $seleccion

        if [[ $selection == "0" ]]; then
                configure_aws
        elif [[ $selection == "1" ]]; then
                configure_azure
        elif [[ $selection == "2" ]]; then
                configure_gcp
        elif [[ $selection == "3" ]]; then
            	audit_aws
        elif [[ $selection == "4" ]]; then
        		audit_azure
        elif [[ $selection == "5" ]]; then
        		echo
        elif [[ $selection == "6" ]]; then
            exec /usr/bin/bash
        fi

}

main
