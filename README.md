# SentryAssignement

Project Overview:

	• Objective: Deploy a self-hosted Sentry instance inside a cloud VM.
	• Cloud Provider: AWS
	• Tools Used: Terraform, Ansible

Steps Completed:
	1. Terraform Configuration:
		○ Created a Terraform script to provision an AWS EC2 instance with the following specifications:
			§ 4 CPU Cores
			§ 16 GB RAM
			§ 20 GB Free Disk Space
	    Included configuration for the key pair to securely access the instance.
	2. Ansible Playbook:
		○ Developed an Ansible playbook to install and configure all necessary dependencies, including:
			§ Docker
			§ Docker Compose
			§ Sentry (self-hosted)
		○ Ensured that all services are started and enabled to run on boot.
  
Testing and Verification:
	• Verified that Sentry is up and running by accessing the web interface and ensuring all components are operational.
   Confirmed that all dependencies and services are correctly installed and configured on the EC2 instance.
