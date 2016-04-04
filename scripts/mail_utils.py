import notmuch


def open_db(read_only=False):
    if read_only:
        mode = notmuch.Database.MODE.READ_ONLY
    else:
        mode = notmuch.Database.MODE.READ_WRITE
    return notmuch.Database(mode=mode)


def list_mails(db, query):
    return list(db.create_query(query).search_messages())


def tag_mail(msg, *tags):
    msg.freeze()
    for tag in tags:
        if tag[0] == '+':
            msg.add_tag(tag[1:])
        elif tag[0] == '-':
            msg.remove_tag(tag[1:])
    msg.thaw()
    msg.maildir_flags_to_tags()


def tag_mails(db, query, *tags):
    msgs = db.create_query(query).search_messages()
    for msg in msgs:
        tag_mail(msg, *tags)


def tag_new_mails(db, query, *tags):
    if query is not None:
        new_query = 'tag:new AND ({})'.format(query)
    else:
        new_query = 'tag:new'
    tag_mails(db, new_query, *tags)
