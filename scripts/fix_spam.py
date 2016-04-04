#!/usr/bin/env python3

from mail_utils import open_db, list_mails, tag_mail
from enum import Enum, unique
import subprocess


@unique
class Mode(Enum):
    unsure_as_ham = 0
    unsure_as_spam = 1
    spam_as_ham = 2
    ham_as_spam = 3


def fix_spam(db, mode):
    bf_arg = '-b'
    if mode == Mode.unsure_as_ham:
        msgs = list_mails(db, 'tag:mark-unsure-as-ham')
        tags = ['-mark-unsure-as-ham', '-spam-unsure']
        bf_arg += 'n'
    elif mode == Mode.unsure_as_spam:
        msgs = list_mails(db, 'tag:mark-unsure-as-spam')
        tags = ['-mark-unsure-as-spam', '-spam-unsure', '+spam']
        bf_arg += 's'
    elif mode == Mode.spam_as_ham:
        msgs = list_mails(db, 'tag:mark-spam-as-ham')
        tags = ['-mark-spam-as-ham', '-spam']
        bf_arg += 'Sn'
    elif mode == Mode.ham_as_spam:
        msgs = list_mails(db, 'tag:mark-ham-as-spam')
        tags = ['-mark-ham-as-spam', '+spam']
        bf_arg += 'Ns'

    bf = subprocess.Popen(['bogofilter', bf_arg], stdin=subprocess.PIPE)

    for msg in msgs:
        filename = msg.get_filename()
        bf.stdin.write(filename.encode())
        bf.stdin.write(b'\n')
        bf.stdin.flush()
        tag_mail(msg, *tags)

    bf.stdin.close()
    bf.wait()


def fix_all_spam(db):
    fix_spam(db, Mode.unsure_as_ham)
    fix_spam(db, Mode.unsure_as_spam)
    fix_spam(db, Mode.spam_as_ham)
    fix_spam(db, Mode.ham_as_spam)


if __name__ == '__main__':
    with open_db() as db:
        fix_all_spam(db)
