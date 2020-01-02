#!/usr/bin/expect -f
#永不超时
set timeout -1
set id [lindex $argv 0]
set send_human {.1 .3 1 .05 2}
array set map {
    "59"  "sx-59"
    "db"  "mtf-8"
    "dev" "mt-111-6"
    "test" "sh-mt-qa-service-test-001"
}

 
spawn ssh jps
 
#根据提示选择：group字段的服务器组选项
expect "*Opt>*"
sleep 0.3
send -h "p\r"

expect "*Opt>*"  {send -h "$map($id)"}
sleep 0.3
send -h "\r"

interact

exec date >> /tmp/expect_history.log

