#!/usr/bin/env python3

from mail_utils import open_db, tag_new_mails
from fix_spam import fix_all_spam
from autotag_new_mails import autotag_new_mails
from classify_spam import classify_spam


if __name__ == '__main__':
    with open_db() as db:
        fix_all_spam(db)
        classify_spam(db)
        autotag_new_mails(db)
