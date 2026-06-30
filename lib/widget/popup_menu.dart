import 'package:bloc_apps/models/task.dart';
import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  // we create voidcall back or frunction for delete purpose

  final Task task;
  // we need voidCallback for function usnderstand that.
  final VoidCallback cancelOrDeleteCallBack;
  // now we need a task construtor file here
  // now for restore value
  final VoidCallback likeorDislike;

  const PopupMenu({
    super.key,
    required this.task,
    required this.cancelOrDeleteCallBack,
    required this.likeorDislike,
  });
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // we use a ternary operator in this place.
      itemBuilder: task.isDeleted == false
          ? ((context) => [
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                ),
                onTap: () {},
              ),
              PopupMenuItem(
                onTap: likeorDislike,
                child: TextButton.icon(
                  onPressed: null,
                  icon: task.isFavorite == false
                      ? Icon(Icons.bookmark_add_outlined)
                      : Icon(Icons.bookmark_remove_outlined),
                  // add condition here for adding and rejecting the bookmarks
                  label: task.isFavorite == false
                      ? Text('Added to Bookmarks')
                      : Text('Remove Bookmarks'),
                ),
              ),
              PopupMenuItem(
                onTap: cancelOrDeleteCallBack,
                child: TextButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                ),
              ),
            ])
          : (context) => [
              PopupMenuItem(
                onTap: cancelOrDeleteCallBack,
                child: TextButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.restore_from_trash_rounded),
                  label: Text('Restore'),
                ),
              ),
              PopupMenuItem(
                onTap: cancelOrDeleteCallBack,
                child: TextButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.delete_forever),
                  label: Text('Delete Forever'),
                ),
              ),
            ],
    );
  }
}
