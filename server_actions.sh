#!/bin/bash

while true; do
        echo ""
        echo "#######################"
        echo "1. Web Server Status"
        echo "2. Start Web Server"
        echo "3. Stop Web Server"
        echo "4. Restart Web Server"
        echo "5. Reload Web Server"
        echo "6. Check Server Config Errors"
        echo "7. Print Test Config Errors"
        echo "8. Exit"
        echo "#######################"
        echo ""
        read -p "Choose an option: " choice

        case $choice in
            1)
                sudo systemctl status nginx
                ;;
            2)
                sudo systemctl start nginx
                ;;
            3)
                sudo systemctl stop nginx
                ;;
            4)
                sudo systemctl restart nginx
                ;;
            5)
                sudo systemctl reload nginx
                ;;
            6)
                sudo nginx -t
                ;;
            7)
                sudo nginx -T
                ;;
            8)
                echo "Exiting..."
                break
                ;;
            *)
                echo "Invalid option, please try again."
                ;;
        esac

        echo ""
        read -p "Press [Enter] key to continue..."
done
