import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/report/report.dart';
import 'package:flutter_phoenix/models/report/report_helper.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/loading_widget.dart';
import 'package:flutter_phoenix/widgets/report_list.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReportListViewPage extends StatefulWidget {
  ReportListViewPage({super.key});

  @override
  _ReportListViewPageState createState() => _ReportListViewPageState();
}

class _ReportListViewPageState extends State<ReportListViewPage> {
  static const _pageSize = 40;

  final PagingController<int, Report?> _reportPagingController =
      PagingController(firstPageKey: 0);

  late final ReportHelper reportHelper;

  @override
  void initState() {
    reportHelper = ReportHelper();
    _reportPagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await reportHelper.getReportList(pageKey, _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _reportPagingController.appendLastPage(newItems);
      } else {
        final int nextPageKey = pageKey + newItems.length;
        _reportPagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _reportPagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => _reportPagingController.refresh(),
      child: PagedListView<int, Report?>(
        pagingController: _reportPagingController,
        builderDelegate: PagedChildBuilderDelegate<Report?>(
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
              return CustomText("Item Empty");
            }
            return ReportList(
              report: item,
              onTap: () async {
                await Routes.push(context, PageName.EditReport,
                    arguments: {"report": item});
                _reportPagingController.refresh();
              },
            );
          },
        ),
      ),
    );
  }
}
