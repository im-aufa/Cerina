# Product Requirements Document: Cerina

## 1. Introduction

Cerina is a mobile application designed to be a personal health assistant for women, with a focus on menstrual and cervical health. The app provides users with an AI-powered chatbot, a period tracker, and educational resources to help them better understand their bodies and take control of their health.

## 2. Target Audience

The target audience for Cerina is women of all ages who want to track their menstrual cycles, learn more about their reproductive health, and get personalized advice from an AI assistant.

## 3. Features

### 3.1. Onboarding
- An engaging, multi-page onboarding experience to introduce new users to the app's features.
- Clear and concise explanations of the app's purpose and benefits.
- A final "Get Started" screen that leads to the main application.

### 3.2. User Authentication
- A simple and secure authentication flow.
- Options to sign in with WhatsApp or Google.
- A "Masuk" (Log In) option for existing users.

### 3.3. Homepage/Dashboard
- A central dashboard that provides a summary of the user's menstrual cycle, including the current day and status.
- A prominent call-to-action to start a conversation with the AI assistant, "Cerince AI".
- A section for educational articles and tips related to women's health.

### 3.4. AI Assistant ("Cerince AI")
- An AI-powered chatbot that can answer questions about menstruation, cervical cancer, and other women's health topics.
- The AI assistant is accessible from the homepage and has its own dedicated chat screen.
- The chat interface displays a "Thinking..." animation while the AI is generating a response.

### 3.5. Calendar
- A calendar view to track the user's menstrual cycle.
- The ability to log menstrual flow, mood, and symptoms.
- A full-screen calendar view that displays the entire month.

### 3.6. Profile
- A user profile screen where users can view and edit their personal information.
- A "Premium" section that offers additional features to subscribed users.
- Options to manage account settings, change the AI's response time, and access service updates.

## 4. Design and UX

- The app follows a custom design system with a pink and white color scheme.
- The UI is clean, modern, and visually appealing, with custom icons and illustrations.
- The app is designed to be responsive and adapt to different screen sizes.

## 5. Technical Requirements

- **Platform:** iOS and Android.
- **Framework:** Flutter.
- **API Communication:** The app communicates with a backend API to power the AI assistant.
- **Authentication:** The app uses an API key to authenticate with the backend.