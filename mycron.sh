#!/bin/bash

touch crontabFile

while true ; do
echo "Select one of the following options available: "
echo "1. Display crontab jobs."
echo "2. Insert a job."
echo "3. Remove a job."
echo "4. Remove all jobs."
echo "5. Exit."

read input
	case $input in 
	1) crontab -l > crontabFile;
	if [[ -s crontabFile ]] ; 
	then
		echo "The command "; awk '{ print$6 }' crontabFile;
		echo "will run on "; awk '{ print$1 }' crontabFile; echo "minute(s)";
		awk '{ print$2 }' crontabFile; echo "hour(s)"; awk '{ print$3 }' crontabFile;
		echo "day of month "; awk '{ print$4 }' crontabFile; echo "month"; 
		awk '{ print$5 }' crontabFile; echo "day of week";
	else
	echo "No Jobs to Display.";
	fi
	;;
	2) echo "Enter the minute(s) of the time to run (0-59) or * for any minute";
	read minutes;
	echo "Enter the hour(s) of the time to run (0-23) or * for any hour";
	read hour;
	echo "Enter the day of the month (1-31) or * for any day";
	read day;
	echo "Enter the month (1-12) or * for any month";
	read month;
	echo "Enter the day of the week (0=Sunday, 1-Monday etc) or * for any day";
	read weekDay;
	echo "Enter the commmand you wish to install";
	read command;
	crontab -l > crontabFile;
	echo "$minutes $hour $day $month $weekDay $command" >> crontabFile;
	crontab -i crontabFile;
	echo "Cron job installed successfullly.";;
	3) echo "Enter the command you wish to delete: ";
		read commandDelete;
		crontab -l > crontabFile;
		sed -i "/$commandDelete/d" crontabFile;
		crontab -i crontabFile;
		echo "Job deleted successfully.";;
	4) crontab -r;
		echo "All Cron jobs removed successfully.";;
	5) rm crontabFile;
		echo "Exiting...";
		exit;;
	esac
done
