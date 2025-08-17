# Cerina

Cerina is a Flutter-based mobile application designed to be a personal health assistant for women. The app provides users with an AI-powered chatbot, a period tracker, and educational resources to help them better understand their bodies and take control of their health.

## Features

- **AI Assistant:** An AI-powered chatbot that can answer questions about menstruation, cervical cancer, and other women's health topics.
- **Period Tracker:** A calendar view to track the user's menstrual cycle, including the ability to log menstrual flow, mood, and symptoms.
- **Educational Resources:** A section for educational articles and tips related to women's health.
- **User Authentication:** Secure authentication flow using Auth0, which can be configured to support various identity providers.
- **Onboarding:** An engaging, multi-page onboarding experience to introduce new users to the app's features.
- **User Profile:** A dedicated screen for users to view and manage their profile information.

## Getting Started

To get started with the Cerina app, you'll need to have Flutter installed on your machine. Then, you can clone the repository and run the app on an emulator or a physical device.

```
git clone https://github.com/im-aufa/Cerina.git
cd Cerina
flutter run
```

## Dependencies

- **auth0_flutter:** For handling user authentication with Auth0.
- **http:** For making HTTP requests to the backend API.
- **flutter_dotenv:** For managing environment variables.
- **smooth_page_indicator:** For displaying a smooth page indicator in the onboarding screen.

## Environment Variables

The app uses environment variables to store sensitive information like API keys and Auth0 credentials. You'll need to create a `.env` file in the root of the project and add the following variables:

```
AUTH0_DOMAIN=your_auth0_domain
AUTH0_CLIENT_ID=your_auth0_client_id
API_KEY=your_api_key
```

Then, you can run the app normally.

```
flutter run
```
