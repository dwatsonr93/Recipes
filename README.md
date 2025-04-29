# Fetch Take Home Project — Recipe App

### Summary
This app displays a list of recipes from the Fetch API. Each recipe shows its name, cuisine type, and a thumbnail image.  
If a YouTube video is available for the recipe, users can tap the "Watch Video" button to open it directly in the YouTube app or Safari.  
All network calls and image loading use Swift Concurrency (`async/await`), and images are manually cached both in memory and on disk without using any third-party libraries.

---

### Focus Areas
- Building everything with SwiftUI, using a simple and clean MVVM structure.
- Making all async tasks (API fetching and image downloading) use `async/await`.
- Creating a manual image caching system (memory + disk) without relying on `URLCache`.
- Keeping the UI responsive by loading images only when they’re needed.
- Handling edge cases like missing YouTube links or empty/malformed API responses.

---

### Time Spent
I spent around **8 to 10 hours** in total.  
Most of the time was split between setting up the networking and caching properly, polishing the UI, and testing different scenarios like bad data or missing images.

---

### Trade-offs and Decisions
- For playing YouTube videos, I decided to open links externally using `UIApplication.shared.open()`, because using `SFSafariViewController` caused issues with YouTube redirects inside the app.
- I kept the caching layer lightweight for this project’s size. If this were production, I would add a more advanced cache eviction policy.
- Instead of adding a lot of extra features, I focused on making the core app solid and simple to use.

---

### Weakest Part of the Project
- The image cache works fine for this project, but with a larger number of images, it would need better memory management.
- Some parts of the UI could be expanded (for example, showing more recipe details), but I stuck to what was asked to stay focused.

---

### Additional Notes
- If no recipes are available, the app shows a clear empty state message.
- If a recipe doesn’t have a YouTube video, the "Watch Video" button doesn’t show at all.
- Everything was built using only Apple's native frameworks, with no external dependencies.
- I tested the app on both simulator and real device to confirm everything worked correctly.
