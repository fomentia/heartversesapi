Simple requests:

    Single verse: www.heartversesapi.com/api/kjv/Genesis/1/1

    Range: www.heartversesapi.com/api/range/kjv/Genesis/1/1-3

    Response: { "translation": "KJV",
                "verses": [
                  {
                      "book":"Genesis", "chapter": 1, "verse": 1,
                      "text":"In the beginning God created the heaven and the earth."
                  },
                  {
                      "book":"Genesis", "chapter": 1, "verse": 2,
                      "text":"And the earth was without form, and void; and darkness
                      was upon the face of the deep. And the Spirit of God moved upon
                      the face of the waters."
                  },
                  {
                      "book":"Genesis", "chapter": 1, "verse": 3,
                      "text":"And God said, Let there be light: and there was light."
                  }
              ]}

Complex request:
            {
                "version": "KJV",
                "passages": {
                      {
                          "start": { "book": "Genesis", "chapter": 1, "verse": 1 }
                          "end": { "book": "Genesis", "chapter": 2, "verse": 5 }
                      },
                      {
                          "start": { "book": "Matthew", "chapter": 3, "verse": 1 }
                          "end": { "book": "Matthew", "chapter": 3, "verse": 6 }
                      }
                }
            }
