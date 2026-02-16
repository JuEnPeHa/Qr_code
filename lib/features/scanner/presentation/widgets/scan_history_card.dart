import 'package:flutter/material.dart';

import '../../domain/entities/scan_record.dart';

class ScanHistoryCard extends StatelessWidget {
  const ScanHistoryCard({
    required this.record,
    required this.onFavoriteTap,
    super.key,
  });

  final ScanRecord record;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(record.type.name.substring(0, 1).toUpperCase())),
        title: Text(record.raw, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text('${record.type.name} • ${record.createdAt}'),
        trailing: IconButton(
          icon: Icon(record.isFavorite ? Icons.star : Icons.star_border),
          onPressed: onFavoriteTap,
        ),
      ),
    );
  }
}
