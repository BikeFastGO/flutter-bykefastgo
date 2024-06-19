import 'package:bykefastgo/domain/entities/bicycle.dart';
import 'package:bykefastgo/domain/entities/bicycleDto.dart';
import 'package:bykefastgo/shared/util/shared_entities/bicycles_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class BicycleSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear), color: Colors.black,),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios), color: Colors.black,);
  }

  @override
  Widget buildResults(BuildContext context) {
    List<BicycleDto> matchQuery = [];
    for (var bicycle in bicyclesLoaded!) {
      if (bicycle.bicycleName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(bicycle);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: Hero(
            tag: result.bicycleId,
            child: Image.network(
              result.imageData,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          title: Text(result.bicycleName),
          subtitle: Text(result.bicycleDescription),
          onTap: () {
            context.push('/bicycle/${result.bicycleId}');
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<BicycleDto> matchQuery = [];
    for (var bicycle in bicyclesLoaded!) {
      if (bicycle.bicycleName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(bicycle);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: Hero(
            tag: result.bicycleId,
            child: Image.network(
              result.imageData,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          title: Text(result.bicycleName),
          subtitle: Text(result.bicycleDescription),
          onTap: () {
            context.push('/bicycle/${result.bicycleId}');
          },
        );
      },
    );
  }
}
