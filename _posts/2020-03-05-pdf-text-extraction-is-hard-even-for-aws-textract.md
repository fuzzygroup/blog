---
layout: post
title: PDF Text Extraction Is Hard Even for AWS Textract
category: aws
tags: ["aws", "python"]
---
{:.center}
![IMG_2329.jpeg](/blog/assets/IMG_2329.jpeg)

I have always found that serendipity plays a large role in my technical life.  For example I recently ran into a great article and discussion thread on PDF Text Extraction:

* [Article](https://www.filingdb.com/pdf-text-extraction)
* [Discussion Thread](https://news.ycombinator.com/item?id=22473263)

The thrust of this article amounts to "PDF Processing Is Hard and Here's Why" (tldr - PDF isn't a document format as much as a layout format and how things are laid out generally bears little relationship to their structure as "document elements").

Now lately I've been involved in some resume processing lately and this made me say:

> Hm... Can I extract just the email addresses programmatically from this stack of resumes?

I found that following the techniques in this [Medium article](https://medium.com/@rqaiserr/how-to-convert-pdfs-into-searchable-key-words-with-python-85aab86c544f), I was able to extract roughly 70% of the email addresses from a small sample.  And while 70% isn't bad, I suspected that better should be possible.  And that led me to the [AWS Textract](https://aws.amazon.com/textract/) service.

Unfortunately what I found was that even the "machine learning" powered Textract service:

> Amazon Textract overcomes these challenges by using machine learning to instantly “read” virtually any type of document to accurately extract text and data without the need for any manual effort or custom code. 

failed to get email addresses reliably out of simple PDF resumes (note - my overall review on Textract is still generally positive; see Conclusion below).  The failure rate was better -- roughly 10% instead of 30% but it still failed.  What I did find fascinating, however, is how AWS Textract works under the hood.  There appear to be  three results from the Textract API call:

* apiResponse.json
* keyValues.csv
* rawText.txt

These three results have different functions:

* a set of bounding boxes with text elements right down to geometry 
* a set of semantic fields that they found in the document (I generally found this pretty useless; for a resume I would have expected things like contact info to be key values; instead it was a graduation date)
* the full text of the document

Here's an example of the apiResponse.json which was the most interesting of these (note that I modified the contact info before to be nonsense values in the interest of candidate privacy):

    "DocumentMetadata": {
        "Pages": 1
      },
      "JobStatus": "SUCCEEDED",
      "Blocks": [
        {
          "BlockType": "PAGE",
          "Geometry": {
            "BoundingBox": {
              "Width": 1,
              "Height": 1,
              "Left": 0,
              "Top": 0
            },
            "Polygon": [
              {
                "X": 0,
                "Y": 0
              },
              {
                "X": 1,
                "Y": 0
              },
              {
                "X": 1,
                "Y": 1
              },
              {
                "X": 0,
                "Y": 1
              }
            ]
          },
          "Id": "87aab91c-10c3-4191-86ef-1a0f250967be",
          "Relationships": [
            {
              "Type": "CHILD",
              "Ids": [
                "84fa231e-2427-4ca5-9b17-4259f503c86b",
                "05b76c03-093d-4910-92d3-fb44105a7ba8",
                "d15f7eec-b028-44cd-ae33-533056aa4781",
                "58e06118-f8e4-480f-b959-3f446bbab5d9",
                "0d917c44-f204-429f-8cbb-8ec9cb5c7e00",
                "463bcf6d-c759-49be-b29f-29037e183064",
                "afe3b98b-7fdb-47ff-8102-593bd827eb8a",
                "ae57ff27-7202-49fa-b655-6bc8b6ffd789",
                "71580491-1cd2-423e-806f-5e0feef655b3",
                "a64ce3df-d8fb-4d83-85df-591d18f4bcb3",
                "8fe6464f-56bd-4c34-97a9-bb006d45b344",
                "35c2359a-116a-40d6-8273-e3f4d4c5e2b4",
                "e1bde700-0c89-42d0-853d-0bc4993399f9",
                "b3109ceb-d8f8-421e-9244-a07a2a9b5239",
                "f5152abc-6df8-48c0-ae3b-77027809101f",
                "a046da52-4cea-4e29-a89a-45f21beea3cb",
                "3cd7399f-6a98-4b4b-897f-78f9b137df21",
                "bef5b4a7-a1c7-450d-8986-491152dd6d2f",
                "f351ecec-c23f-4a3a-b9f5-424e596c9415",
                "75e884d1-50f9-4065-8f69-2d4b58e30d4a",
                "9a296dac-b804-4613-996b-edfceccfe256",
                "ae7d1032-90a2-4274-987e-e8eafc61d7e7",
                "2dc6fe79-2a69-48cb-a4ba-bf8a405acbcd",
                "d4652eb5-9071-4451-8fcf-46bd61f1c036",
                "b0fa99d4-fa78-41c7-adf4-0e856e5fbf7b",
                "d7ac3623-e47c-4200-b55c-11f534058333",
                "8e157557-b7ab-432b-b0a7-91aaa90672fc",
                "f602d231-16ef-4eb4-bf25-b03103a9ea06",
                "836e2ef9-1400-4091-82ba-c89483dea265",
                "52c86df4-7855-4c6d-b6ed-7bce72e0e27b",
                "f549a067-879d-4536-93df-47b2be6522ea",
                "e3340758-ab33-4029-894b-a95b2291e8d9",
                "5e72a4a3-cb40-4760-b4d9-2168e35d20a7",
                "a9ee3dfb-67da-4f70-b72e-296302fe73bd",
                "740d09a0-cbe1-4094-af3f-240a492f7742",
                "99ed5bc2-8bc5-48c8-8fb1-d25984702d49",
                "bfd03b33-7bdc-4115-bfc5-3c2aa2cc2c07",
                "e4fb79b6-6015-46a2-8474-d0aa12f3ab8c",
                "62c38550-9fb4-4f8f-ae31-d7137294439e",
                "0d8fa105-9bcb-4a6d-b3f9-f3332202edfe",
                "8a221c4f-0fc4-4db8-b550-5b4592d9d7cd",
                "290058c0-1c75-43b8-b158-bdd409ae8a83",
                "98ae6f91-842a-4aa9-b78b-7bed745ad9cd",
                "f4e7228c-6117-462f-a2de-12fe9fdbd318",
                "8dbc468c-5323-4df0-895c-8ec141d270ff",
                "1bd5d158-a9f5-4942-aecb-1ad4acbe0242",
                "3c2c9a98-32cd-44bd-a41d-2d167fd0c660",
                "ffe50c97-3ef7-485d-9662-0e51bc0532e9",
                "44eab195-e89f-4468-a6ac-7e783eea7e70",
                "905344ed-5bb6-4a48-90c1-91ec5df2731e",
                "9a9d401a-646f-4c63-848e-c63ced45613c",
                "c169fa15-17a9-4d66-a2a5-d04604717f41",
                "5fdaccd1-0548-40d6-91f5-e715ea6cc7cc",
                "4931b0c8-d22a-49b5-b693-7c8e2cd57b2b",
                "91568b1f-4724-40d0-8018-29385ff48b41",
                "38ed7115-a109-40f9-bc58-efd346b0189d",
                "ba5b8e71-c982-49a4-a32e-2505eb07634a",
                "2f25027e-774c-4284-a52a-615fef4b8a9e",
                "bb2239fe-e9e0-4498-8632-94a7edcb144e",
                "1d651db9-1518-4432-85d2-9d7cf9362847",
                "e419bc6c-690a-4bef-b830-1b991b88949c",
                "1e5306d2-e0ea-4b47-953e-8140b8c7cbcb",
                "71fb110f-a8a6-4285-bc25-63941faf0778",
                "62832387-9ea9-4564-a4c3-871c5f15d729",
                "59b7a3e4-acea-4625-b6f8-05886d558e52",
                "14336d40-fd0c-47b7-aff6-5213c6d7a0f7",
                "e58e4ba0-567f-494d-91d8-fb2c4aa6eec0",
                "29cea082-c4df-41cf-9a68-1c9a388be9b3",
                "24abce03-8a73-4c2e-9bca-e25ee82d7ce5"
              ]
            }
          ],
          "Page": 1
        },
        {
          "BlockType": "LINE",
          "Confidence": 99.34569549560547,
          "Text": "Austin Johnson",
          "Geometry": {
            "BoundingBox": {
              "Width": 0.17683932185173035,
              "Height": 0.01665823720395565,
              "Left": 0.4110524356365204,
              "Top": 0.046603888273239136
            },
            "Polygon": [
              {
                "X": 0.4110524356365204,
                "Y": 0.046603888273239136
              },
              {
                "X": 0.5878917574882507,
                "Y": 0.046603888273239136
              },
              {
                "X": 0.5878917574882507,
                "Y": 0.06326212733983994
              },
              {
                "X": 0.4110524356365204,
                "Y": 0.06326212733983994
              }
            ]
          },
          "Id": "84fa231e-2427-4ca5-9b17-4259f503c86b",
          "Relationships": [
            {
              "Type": "CHILD",
              "Ids": [
                "b90a16d9-f9a8-40b9-8407-1f41d7434c0f",
                "af247f18-04bb-45ce-b48b-884440f3f669"
              ]
            }
          ],
          "Page": 1
        },
        {
          "BlockType": "LINE",
          "Confidence": 91.6850357055664,
          "Text": "+1 (267) 999-8879",
          "Geometry": {
            "BoundingBox": {
              "Width": 0.14686554670333862,
              "Height": 0.014410415664315224,
              "Left": 0.08256683498620987,
              "Top": 0.06718409806489944
            },
            "Polygon": [
              {
                "X": 0.08256683498620987,
                "Y": 0.06718409806489944
              },
              {
                "X": 0.2294323742389679,
                "Y": 0.06718409806489944
              },
              {
                "X": 0.2294323742389679,
                "Y": 0.08159451931715012
              },
              {
                "X": 0.08256683498620987,
                "Y": 0.08159451931715012
              }
            ]
          },
          "Id": "05b76c03-093d-4910-92d3-fb44105a7ba8",
          "Relationships": [
            {
              "Type": "CHILD",
              "Ids": [
                "9b1f5522-2874-4348-9deb-c91b8f46ffe0",
                "4331a1bf-ecc0-4d5a-b4fe-d19b1a3629d5",
                "8c09ea37-ace2-4dd3-83e2-83137fc27f10"
              ]
            }
          ],
          "Page": 1
        },
        {
          "BlockType": "LINE",
          "Confidence": 98.89478302001953,
          "Text": "austinjohnson@gmail.com",
          "Geometry": {
            "BoundingBox": {
              "Width": 0.21318471431732178,
              "Height": 0.015170887112617493,
              "Left": 0.7046566009521484,
              "Top": 0.06679927557706833
            },
            "Polygon": [
              {
                "X": 0.7046566009521484,
                "Y": 0.06679927557706833
              },
              {
                "X": 0.9178413152694702,
                "Y": 0.06679927557706833
              },
              {
                "X": 0.9178413152694702,
                "Y": 0.08197016268968582
              },
              {
                "X": 0.7046566009521484,
                "Y": 0.08197016268968582
              }
            ]
          },
          "Id": "d15f7eec-b028-44cd-ae33-533056aa4781",
          "Relationships": [
            {
              "Type": "CHILD",
              "Ids": [
                "4e82dc44-c82f-4b30-b830-d13d201f61ad"
              ]
            }
          ],
          "Page": 1
        },

It would actually be pretty simply to take this JSON and walk across it with a map operation on a series of regular expressions and extract an email address -or- a header block (on the assumption that resumes have contact info in the first say 10 lines of the resume).

## Conclusion

Even though I wasn't as impressed by the Textract as I wanted to be, it:

* performed quite well
* was easier to get running that using Python and NLTK
* didn't return the amount of garble text (i.e. PDF display instructions) that I saw using Python
* structured the API results well enough that I could easily manipulate it to get the information I wanted out of the result

Bravo AWS!  Nicely done.