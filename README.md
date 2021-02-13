DevOps evaluation tasks

1. Task: Clone repository ... with DevOps task examples

2. Task: Enter ```opstasks/python``` directory view and start the python application script ```div.py``` from command line. The script will start a simple webservice listening on port ```:5001```  for http GET request with two integer parameters ```a``` and ```b``` which will return the result of integer division as a plain text

3. Task: Make a test http GET request using ```curl``` 

Example:
```
curl -X GET http://hostname:port?...
```

Values:
```
?a=5&b=2
?a=5&b=5
?a=1&b=2
?a=3&b=0
```

 4. Task:  Enter the docker directory ```opstasks/docker``` and use ```Dockerfile``` as a template to:
	- Create a docker image ```python-app``` for application script ```div.py```
	- Start docker container with ```python-app``` image exposing the service on port ```:8080```

5. Task: Enter k8s example directory ```opstasks/k8s``` and:
	- Start ```minikube``` with command: ```minikube start```
	- Check available namespaces
	- List all running pods
	- List all running deployments
	- Scale up ```nginx-proxy-deployment``` deployment up to 5 replicas
	- Can you create a deployment which run 3 replicas with docker image ```python-app``` on port ```:5001```

6. Task: Database. There is already existing MySQL database ```db_sportsbook``` with two tables ```tCustomer``` and ```tBet``` with random data:

```
-- create tCustomer
CREATE TABLE tCustomer (
        cust_id  INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(64),
        cr_date DATE,
        country_code VARCHAR(3)
);

-- create tBet
CREATE TABLE tBet (
        bet_id INT AUTO_INCREMENT PRIMARY KEY,
        cust_id INT,
        seln_id INT,
        plc_date DATE,
        price DECIMAL(9,6),
        amount DECIMAL(12,3),
        FOREIGN KEY (cust_id)
               REFERENCES tCustomer (cust_id)
                ON UPDATE RESTRICT ON DELETE CASCADE
);
```

Use ```mysql``` client from command line to establish DB session and execute following tasks:

	- Update ```country_code = "AUS"``` for ```cust_id = 13```
	- Select all bets from ```tBet``` for ```cust_id = 42```
	- How can we improve the select statement speed for the task above?
