DevOps evaluation tasks

1. Task: Clone repository https://github.com/stoyanpisov/opstasks.git with DevOps task examples

2. Task: Enter ```opstasks/python``` directory view and start the python application script ```div.py``` from command line. The script will start a simple webservice listening on port ```:5001```  for http GET request with two integer parameters ```a``` and ```b``` which will return the result of integer division as a plain text

3. Task: Make a test http GET request using ```curl``` 

Example:
```
curl -X GET http://hostname:port?...
```

Values:
```
?a=5&b=2
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
	- Create ```prod``` namespace
	- Create ```nginx-proxy-deployment``` deployment in ```prod``` namespace and then scale up the deployment up to 5 replicas
	- Can you create a deployment which run 3 replicas with docker image ```python-app``` on port ```:5001``` using ```nginx-proxy-deployment``` as a template

6. Task: Database. There is already existing MySQL database ```db_sportsbook``` with two tables ```tCustomer``` and ```tBet```:

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

Populated with random data:

```
MariaDB [db_sportsbook]> select * from tCustomer limit 10;
+---------+------------------+------------+--------------+
| cust_id | username         | cr_date    | country_code |
+---------+------------------+------------+--------------+
|       1 | elinor.assante   | 2015-04-10 | BRB          |
|       2 | kathi.eggebrecht | 2021-10-15 | GBR          |
|       3 | vito.cahill      | 2020-11-24 | MEX          |
|       4 | loree.karsten    | 2017-08-06 | MEX          |
|       5 | onita.lindholm   | 2011-04-26 | BRB          |
|       6 | hollis.neault    | 2018-09-24 | MEX          |
|       7 | cristin.maccini  | 2015-07-27 | GBR          |
|       8 | sherry.schoville | 2019-08-27 | AUS          |
|       9 | lynell.hsiao     | 2019-07-28 | USA          |
|      10 | chantel.cauley   | 2012-12-01 | GBR          |
+---------+------------------+------------+--------------+

MariaDB [db_sportsbook]> select * from tBet limit 10;
+--------+---------+---------+------------+----------+--------+
| bet_id | cust_id | seln_id | plc_date   | price    | amount |
+--------+---------+---------+------------+----------+--------+
|      1 |      88 |     414 | 2017-01-26 | 1.149000 |  8.150 |
|      2 |      82 |     538 | 2013-06-13 | 2.406000 |  1.470 |
|      3 |      98 |     834 | 2020-07-05 | 1.745000 |  2.960 |
|      4 |      72 |     325 | 2016-04-02 | 1.248000 |  7.550 |
|      5 |      54 |      80 | 2016-01-25 | 1.556000 |  7.270 |
|      6 |       1 |     927 | 2013-10-23 | 2.840000 | 10.640 |
|      7 |      48 |     919 | 2016-06-10 | 2.264000 |  6.390 |
|      8 |      77 |     614 | 2016-10-08 | 2.379000 |  8.360 |
|      9 |      71 |      42 | 2012-06-18 | 2.909000 |  5.240 |
|     10 |      62 |     651 | 2014-11-11 | 2.499000 | 10.840 |
+--------+---------+---------+------------+----------+--------+
```

Using ```mysql``` command line client from command line try the following tasks:

 - Update ```country_code = "AUS"``` for ```cust_id = 23```
 - Select all bets from ```tBet``` for ```country_code = "GBR"```
 - How can we improve the select statement speed for the task above?

7. Task: Using linux shell. Enter ```opstasks/shell``` directory.

The file ```logs/apache_access``` contains randomized Apache http server logs:

 - Find all log lines starting with 81
 - Find all log lines between ```20:17``` and ```20:18``` on ```15/Mar/2021```
 - Create new log file ```logs/apache_access_edited``` where http PUT request ```PUT /playbooks``` is replaced by ```PUT /playbooks_new```
 - Can you count number of http GET request per minute from ```logs/apache_access```
 - Execute ```gen_folders.sh``` bash script which will generate randomized folder strucutre under ```/tmp/data/pod-{a..h}/access-YYYYmmddHHMM.log``` directory. Find all files matching  years between 2017 and 2029.

8. Task: Ansible. Enter ```opstasks/ansible``` directory and use already existing inventory ```inventory/all``` with three identical VM's:

```
[all]
centos-7-vm-[01:03]
```

Execute ad-hoc ```shell``` command ```minikube start``` using ansible and start ```minikube``` service as ```gnlops``` user.

Hint: Use command simmilar to:

```
ansible  ... -m shell -a "..." ...
```

9. Task: Create free style Jenkins job


Change current working directory into ```jenkins``` and execute

```
./get_url.sh
```

Open the url in a browser with provided credentials for ```gnlops```. Create either a new free style Jenkins project or a Jenkins pipeline which includes at lest three steps:

- Checkout ```origin/master``` branch of GitHub repository https://github.com/stoyanpisov/picalc.git into seprate ```/src``` sub directory
- Build simple project using following shell command

```
docker run --rm -v ${WORKSPACE}/src:/src -w /src gcc:9.3 make build
```

- Open repository ```Makefile``` and decide how can add a test step
