import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_responce/news_responce.dart';
import 'package:news/news/news_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});
  static const String routeName = 'search';

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late TextEditingController searchController;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments as String?;
    searchQuery = args ?? '';
    searchController.text = searchQuery;
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      searchQuery = searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: TextField(
              controller: searchController,
              cursorColor: AppTheme.primary,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                fillColor: AppTheme.white,
                filled: true,
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: AppTheme.primary,
                  ),
                  onPressed: () {
                    searchController.clear();
                  },
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: AppTheme.primary,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: AppTheme.primary,
          foregroundColor: AppTheme.white,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            color: AppTheme.white,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(35),
              right: Radius.circular(35),
            ),
          ),
        ),
        body: FutureBuilder<NewsResponce>(
          future: ApiService.searchNews(searchQuery),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator();
            } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
              return const ErrorIndicator();
            } else {
              final newsList = snapshot.data!.news!;
              return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final newsItem = newsList[index];
                  return NewsItem(newsItem);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
