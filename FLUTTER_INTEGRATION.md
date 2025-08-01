# Integrating the Chat API with a Flutter Application

This document outlines the steps required to connect a Flutter application to the Cerince Chat API.

## 1. Overview

The Chat API provides two main endpoints for interacting with the backend service:

-   `POST /chat`: Submits a query and receives a response from the RAG model.
-   `POST /process`: Triggers the backend to process and embed new documents from the configured data source.

The API is secured using Auth0, so all requests to these endpoints must be authenticated.

## 2. Authentication

Authentication is handled via JSON Web Tokens (JWTs) issued by Auth0. Your Flutter application will need to handle the user login flow and acquire an access token.

### Flutter Configuration Steps:

1.  **Install an Auth0 SDK:** Use a package like `auth0_flutter` to manage the authentication flow.
    ```yaml
    # pubspec.yaml
    dependencies:
      auth0_flutter: ^1.0.0 # Use the latest version
    ```

2.  **Configure the SDK:** In your Flutter project, configure the Auth0 client with the `AUTH0_DOMAIN` and `AUTH0_CLIENT_ID` provided by the backend team. You will also need the `API_AUDIENCE`.

3.  **Implement Login:** Use the SDK to redirect the user to the Auth0 login page. After a successful login, the SDK will securely store the access token.

4.  **Retrieve the Access Token:** Before making an API call, retrieve the stored access token from the SDK.

## 3. Making API Calls

All API requests must include the access token in the `Authorization` header.

-   **Header:** `Authorization: Bearer <YOUR_ACCESS_TOKEN>`
-   **Content-Type:** `application/json`

We recommend using a package like `http` or `dio` in Flutter to handle network requests.

### Example: Using `http` package

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

// Assume you have a function to get the token from the Auth0 SDK
Future<String> getAccessToken() async {
  // ... logic to retrieve token from auth0_flutter ...
  return "your_retrieved_access_token";
}

Future<void> postQuery(String userQuery) async {
  const String apiUrl = 'https://your-api-domain.com/chat'; // Replace with the actual API URL
  final String token = await getAccessToken();

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      'query': userQuery,
      'n_results': 5,
    }),
  );

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    print('API Response: ${responseBody['response']}');
  } else {
    print('Failed to get response: ${response.statusCode}');
    print('Error: ${response.body}');
  }
}
```

## 4. API Endpoints

### 4.1. Chat Endpoint

-   **URL:** `/chat`
-   **Method:** `POST`
-   **Description:** Sends a user's query to the RAG model and gets an answer.

**Request Body (`application/json`):**

```json
{
  "query": "What are the early symptoms of cervical cancer?",
  "n_results": 5
}
```

-   `query` (string, required): The question to ask.
-   `n_results` (integer, optional, default: 5): The number of relevant document chunks to retrieve.

**Success Response (200 OK):**

```json
{
  "response": "Based on the provided documents, early symptoms of cervical cancer can include...",
  "retrieved_chunks": [
    {
      "doc_id": "some_doc_id",
      "doc_name": "cervical_cancer_faq.pdf",
      "chunk_index": 12,
      "text": "...",
      "filename": "cervical_cancer_faq.pdf",
      "page_numbers": [3],
      "title": "Early Symptoms",
      "source_type": "google_drive",
      "distance": 0.2345
    }
  ]
}
```

### 4.2. Process Documents Endpoint

-   **URL:** `/process`
-   **Method:** `POST`
-   **Description:** Triggers the processing of documents from a specified source. This is typically an administrative action.

**Request Body (`application/json`):**

To process from the default Google Drive folder:
```json
{
  "source_type": "google_drive"
}
```

To process from a specific local folder on the server:
```json
{
  "source_type": "local",
  "local_folder_path": "/path/to/docs/on/server"
}
```

**Success Response (200 OK):**

```json
{
  "status": "success",
  "message": "Documents processed successfully."
}
```

## 5. Error Handling

The API will return standard HTTP status codes for errors.

-   `401 Unauthorized`: The access token is missing, invalid, or expired. The Flutter app should attempt to refresh the token or prompt the user to log in again.
-   `400 Bad Request`: The request body is malformed or missing required fields.
-   `500 Internal Server Error`: An unexpected error occurred on the server.

Your Flutter application should handle these responses gracefully.
