const String fetchHomepageQuery = r'''
query(
    $page: Int!,
    $perPage: Int!,
    $sort : [MediaSort],
    $type : MediaType,
) {
    Page(page: $page, perPage: $perPage) {
        media(isAdult: false, type: $type, sort: $sort ) {
            id
            title { romaji english }
            coverImage { large }
            meanScore
            genres
        }
    }
}''';
