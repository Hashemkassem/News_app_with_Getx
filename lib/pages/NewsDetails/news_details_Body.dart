// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsBody extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetailsBody({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Article Header
          Row(
            children: [
              Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Article Content',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Content
          Text(
            newsModel.content ??
                newsModel.description ??
                'No content available',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 2.0,
                  fontSize: 16,
                ),
          ),

          SizedBox(height: 24),

          // Read More Section
          if (newsModel.url != null && newsModel.url!.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Want to read more?',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Continue reading the full article on the source website.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final url = newsModel.url!;
                      if (await canLaunch(url)) {
                        await launch(url,
                            forceSafariVC: false, forceWebView: false);
                      }
                    },
                    icon: Icon(Icons.open_in_browser),
                    label: Text('Read Full Article'),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          SizedBox(height: 24),

          // Article Metadata
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Article Details',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.person,
                        size: 20, color: Theme.of(context).primaryColor),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Author: ${newsModel.author ?? 'Unknown'}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.source,
                        size: 20, color: Theme.of(context).primaryColor),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Source: ${newsModel.source.name}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time,
                        size: 20, color: Theme.of(context).primaryColor),
                    SizedBox(width: 8),
                    Text(
                      'Published: ${_formatDate(newsModel.publishedAt)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 32),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} at ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
