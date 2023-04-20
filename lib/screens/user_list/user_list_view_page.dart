import 'package:flutter/material.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/loading_widget.dart';
import 'package:flutter_phoenix/widgets/user_list.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserListViewPage extends StatefulWidget {
  UserListViewPage({super.key});

  @override
  _UserListViewPageState createState() => _UserListViewPageState();
}

class _UserListViewPageState extends State<UserListViewPage> {
  static const _pageSize = 40;

  final PagingController<int, User?> _userPagingController =
      PagingController(firstPageKey: 0);

  late final UserHelper userHelper;

  @override
  void initState() {
    userHelper = UserHelper();
    _userPagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await userHelper.getUserList(pageKey, _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _userPagingController.appendLastPage(newItems);
      } else {
        final int nextPageKey = pageKey + newItems.length;
        _userPagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _userPagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => _userPagingController.refresh(),
      child: PagedListView<int, User?>(
        pagingController: _userPagingController,
        builderDelegate: PagedChildBuilderDelegate<User?>(
          firstPageProgressIndicatorBuilder: (context) {
            return LoadingWidget();
          },
          noItemsFoundIndicatorBuilder: (context) {
            return const Center(
                child: CustomText(
              "NO USER FOUND",
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ));
          },
          itemBuilder: (context, item, index) {
            if (item == null) {
              return const CustomText("Item Empty");
            }
            return UserList(user: item);
          },
        ),
      ),
    );
  }
}
