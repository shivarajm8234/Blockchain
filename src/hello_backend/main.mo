import Array "mo:base/Array";
import Debug "mo:base/Debug";

actor LinkedInClone {

    // Define the structure of a Post
    public type Post = {
        author: Text;
        content: Text;
        timestamp: Int;
    };

    // Store posts in an array
    var posts: [Post] = [];

    // Add a new post
    public func addPost(author: Text, content: Text, timestamp: Int): async Bool {
        // Check if content is empty
        if (content == "") {
            Debug.print("Error: Cannot add an empty post.");
            return false;
        };

        // Create a new post
        let newPost: Post = { author; content; timestamp };
        
        // Append the new post to the posts array
        posts := Array.append<Post>(posts, [newPost]);
        Debug.print("New post added: " # content);
        return true;
    };

    // Get all posts
    public query func getPosts(): async [Post] {
        return posts;
    };

    // Clear all posts (for testing purposes)
    public func clearPosts(): async Bool {
        posts := [];
        Debug.print("All posts cleared.");
        return true;
    };
}
