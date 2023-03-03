workspace "Eggceptional" "Architectural view of the system" {
    !adrs doc/adr
    !docs doc/deliverables
    !plugin com.structurizr.dsl.plugins.plantuml.PlantUMLEncoderPlugin

    model {
        /* define personas and systems */


        mySystem = softwareSystem "My System" "some system" ""{
            cont = container "My Container" "Some container" "" "existing_system"
            db = container "Database" "Stores all the things" "" "Database"
        }



        /* relations */


        deploymentEnvironment "Production" {
            deploymentNode "Cloud environment" "" "Azure" {
                deploymentNode "App Services"  "" "" "Microsoft Azure - App Services"{
                    containerInstance cont
                }
                deploymentNode "Queue Storage"  "" "" "Microsoft Azure - Storage Queue"{
                    containerInstance cont
                }
                deploymentNode "Web Jobs"  "" "" "Microsoft Azure - Web Jobs"{
                    containerInstance cont
                }
                deploymentNode "Blob Storage"  "" "" "Microsoft Azure - Blob Block"{
                    containerInstance cont
                }
                deploymentNode "SQL Storage"  "" "" "Microsoft Azure - SQL Database"{
                    containerInstance cont
                    containerInstance cont
                }
            }
            deploymentNode "Customer's mobile device" "" "Apple iOS or Android" {
                softwareSystemInstance mySystem
            }
            deploymentNode "Customer's computer" "" "" {
                deploymentNode "Web Browser" "" "" {
                    softwareSystemInstance mySystem
                }
            }

        }


    }
    views {
        themes default "https://static.structurizr.com/themes/microsoft-azure-2023.01.24/theme.json"

        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        systemContext mySystem "mySystemContext" {
            include *
            autoLayout
        }

        container mySystem "mySystemContainer" {
            include *
            autoLayout
        }
        deployment mySystem "Production" "ProductionDeployment" {
            include *
            autoLayout
        }

        !include styles.dsl
        !include terminology.dsl
    }
}