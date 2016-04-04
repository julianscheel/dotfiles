#!/usr/bin/env python3

from mail_utils import open_db, list_mails
import os
import subprocess


def learn(msgs, spam):
    bf_arg = '-b'
    if spam:
        bf_arg += 's'
    else:
        bf_arg += 'n'
    bf = subprocess.Popen(['bogofilter', bf_arg], stdin=subprocess.PIPE)

    for msg in msgs:
        filename = msg.get_filename()
        bf.stdin.write(filename.encode())
        bf.stdin.write(b'\n')
        bf.stdin.flush()

    bf.stdin.close()
    bf.wait()


if __name__ == '__main__':
    maildir = os.getenv('MAILDIR')
    bogofilter_dir = os.path.join(maildir, '.bogofilter')
    try:
        os.rename(bogofilter_dir, bogofilter_dir + '_bak')
    except FileNotFoundError:
        pass

    with open_db(read_only=True) as db:
        spam = list_mails(db, 'tag:spam')
        learn(spam, True)
        del spam

        ham = list_mails(db, 'not tag:spam and not tag:spam-unsure')
        learn(ham, False)
        del ham
