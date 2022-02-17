package com.talemetry.database.deployer.scripts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.talemetry.database.deployer"})
public class TalemetryScriptsDeployerApplication {

    public static void main(String[] args) {try {
            SpringApplication.run(TalemetryScriptsDeployerApplication.class, args);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
