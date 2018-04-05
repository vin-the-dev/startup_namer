INSERT INTO `service_logs`
(`emp_id`, `customer`, `srn`, `esn`, `start_from`, `site_arrival`, 
`site_departure`, `service_date`, `status1`, `status2`, `service_type`, 
`recommendation`, `da`, `km`, `no_engg`) 
VALUES 
(1,'Vineeth','srn','esn',100,'10:00 AM',
'11:00 AM','01-04-2018','CLOSE','MHP','AMC',
'recommendation','10.0','10','1')



"emp_id" : "1",
"customer" : "Vineeth",
"srn" : "srn",
"esn" : "esn",
"start_from" : "1000",
"site_arrival" : "11:00 AM",
"site_departure" : "12:00 AM",
"service_date" : "01-04-2018",
"status1" : "CLOSE",
"status2" : "MHP",
"service_type" : "AMC",
"recommendation" : "Recommendation",
"da" : "10.0",
"km" : "12",
"no_engg" : "2",

'" . $obj["emp_id"] . "',
'" . $obj["customer"] . "',
'" . $obj["srn"] . "',
'" . $obj["esn"] . "',
'" . $obj["start_from"] . "',
'" . $obj["site_arrival"] . "',
'" . $obj["site_departure"] . "',
'" . $obj["service_date"] . "',
'" . $obj["status1"] . "',
'" . $obj["status2"] . "',
'" . $obj["service_type"] . "',
'" . $obj["recommendation"] . "',
'" . $obj["da"] . "',
'" . $obj["km"] . "',
'" . $obj["no_engg"] . "'