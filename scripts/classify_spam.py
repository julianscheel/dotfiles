#!/usr/bin/env python3

from mail_utils import open_db
import subprocess


def classify_spam(db):
    msgs = list(db.create_query('tag:check-spam').search_messages())
    bf = subprocess.Popen(['bogofilter', '-buT'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)

    for msg in msgs:
        filename = msg.get_filename()
        bf.stdin.write(filename.encode())
        bf.stdin.write(b'\n')
        bf.stdin.flush()
        output = bf.stdout.readline().decode()
        result = output[len(filename) + 1]

        msg.freeze()
        msg.remove_tag('spam')
        msg.remove_tag('spam-unsure')
        if result == 'S':
            msg.add_tag('spam')
        elif result == 'U':
            msg.add_tag('spam-unsure')

        msg.remove_tag('check-spam')
        msg.thaw()

    bf.stdin.close()
    bf.wait()


if __name__ == '__main__':
    with open_db() as db:
        classify_spam(db)
