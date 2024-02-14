class MovieModel{
  String? imageAssets;
  String? movieName;
  String? movieRating;
  String? year ;
  String? description;
  final List<Map>? cast ;
  final List<Map>? comments ;
  String? trailer ;
  final List<String>? tags;
  MovieModel({
    this.cast,
    this.comments,
    this.imageAssets,
    this.movieName,
    this.movieRating,
    this.year,
    this.description,
    this.trailer,
    this.tags

});

}
final forYouImages =[
  MovieModel(imageAssets: "images/movie_images/fast_furious.jpg"),
  MovieModel(imageAssets: "images/movie_images/joker.jpg"),
  MovieModel(imageAssets: "images/movie_images/roman.jpg"),
  MovieModel(imageAssets: "images/movie_images/titanic.jpg"),
  MovieModel(imageAssets: "images/movie_images/interstellar.jpg")
];

final popularImages =[
  MovieModel(
    imageAssets: "images/movie_images/fast_furious.jpg",
    movieName: "Fast and Furious",
    description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",
    trailer: "images/joker_video.mp4",
      tags:["Epic","abanob", "naeem"],
    cast: [
      {
        "name":"Abanob Naeem",
        "role":"cris bam",
        "image":"images/user_imagejpg.jpg"
      },
      {
        "name":"Habiba",
        "role":"cris bam",
        "image":"images/user_imagejpg.jpg"
      },
      {
        "name":"Mayar",
        "role":"cris bam",
        "image":"images/user_imagejpg.jpg"
      }
    ],
    year: "2020",
    movieRating: "3.4",
    comments: [
      {
        "name":"dareen",
        "imageUrl":"images/user_imagejpg.jpg",
        "date":"June 14,2021",
        "rating":"2.0",
        "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"

      },
      {
        "name":"fatma",
        "imageUrl":"images/user_imagejpg.jpg",
        "date":"June 14,2021",
        "rating":"2.0",
        "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
      }
    ]

  ),
  MovieModel(
      imageAssets: "images/movie_images/joker.jpg",
      movieName: "joker",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",
      trailer: "images/joker_video.mp4",
      tags:["Epic","abanob", "naeem"],
      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  ),
  MovieModel(
      imageAssets: "images/movie_images/interstellar.jpg",
      movieName: "interstellar",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",
      tags:["Epic","abanob", "naeem"],
      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  ),
  MovieModel(
      imageAssets: "images/movie_images/roman.jpg",
      movieName: "roman",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",

      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  ),
  MovieModel(
      imageAssets: "images/movie_images/titanic.jpg",
      movieName: "Titanic",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",

      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  )
];
final legendaryImages =[
  MovieModel(
      imageAssets: "images/movie_images/fast_furious.jpg",
      movieName: "Fast and Furious",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",

      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  ),
  MovieModel(
      imageAssets: "images/movie_images/joker.jpg",
      movieName: "joker",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",

      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  ),
  MovieModel(
      imageAssets: "images/movie_images/interstellar.jpg",
      movieName: "interstellar",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",

      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  ),
  MovieModel(
      imageAssets: "images/movie_images/roman.jpg",
      movieName: "roman",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",

      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  ),
  MovieModel(
      imageAssets: "images/movie_images/titanic.jpg",
      movieName: "Titanic",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",

      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  )
];

final genresImages =[

  MovieModel(
      imageAssets: "images/genres_images/geners1.jpg",
      movieName: "Action",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",

      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  ),
  MovieModel(
      imageAssets: "images/genres_images/geners2.jpg",
      movieName: "comedy",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",

      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  ),
  MovieModel(
      imageAssets: "images/genres_images/geners3.jpg",
      movieName: "triagidy",
      description: "Joker, Arthur Fleck, a struggling comedian living in Gotham City, is relentlessly beaten down by society. As he grapples with mental illness and a sense of isolation, he begins to unravel, transforming into the iconic supervillain known as the Joker. Set against the backdrop of a city overrun by corruption and inequality, Arthur's descent into madness is both chilling and tragic.",

      cast: [
        {
          "name":"Abanob Naeem",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Habiba",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        },
        {
          "name":"Mayar",
          "role":"cris bam",
          "image":"images/user_imagejpg.jpg"
        }
      ],
      year: "2020",
      movieRating: "3.4",
      comments: [
        {
          "name":"dareen",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        },
        {
          "name":"fatma",
          "imageUrl":"images/user_imagejpg.jpg",
          "date":"June 14,2021",
          "rating":"2.0",
          "comment":"movie m3afen ma7desh ytfareg ya gma3a bgd"
        }
      ]

  ),
];
