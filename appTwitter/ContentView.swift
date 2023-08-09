//
//  ContentView.swift
//  appTwitter
//
//  Created by Alejandro Villagrán Poblete on 21-07-23.
//

import SwiftUI
extension Color{
  static var twitterBlue: Color = Color(red: 29/255, green: 161/255, blue: 241/255)
}

struct ContentView: View {
  
  private let tweets: [Tweet] = [
    Tweet(authorName: "alejandro villagran", authorUserName: "aleMVP", timestampText: "4h", text: "buenos dias", numberOfReplies: 2, numberOfRetweets: 0, numberOfLikes: 120),
    Tweet(authorName: "Nicolas Miranda", authorUserName: "Darknamor", timestampText: "1h", text: "aguante el capitalismo", numberOfReplies: 22, numberOfRetweets: 68, numberOfLikes: 1152),
    Tweet(authorName: "Cristian Aguayo", authorUserName: "Icicag", timestampText: "2h", text: "quiero llegar a jugar bien al tenis", numberOfReplies: 2, numberOfRetweets: 0, numberOfLikes: 120),
    Tweet(authorName: "Max33Verstañen", authorUserName: "Darknamor", timestampText: "1h", text: "Thanks @LandoNorris 🏆😉", numberOfReplies: 22, numberOfRetweets: 68, numberOfLikes: 1152),
    Tweet(authorName: "@IbaiLlanos", authorUserName: "Darknamor", timestampText: "1h", text: "Gracias por formar parte del mayor directo de la historia.", numberOfReplies: 22, numberOfRetweets: 68, numberOfLikes: 1152),
    Tweet(authorName: "TheNotoriousMMA", authorUserName: "Darknamor", timestampText: "1h", text: "A great evening with family celebrating the Christening of my cousins young son 🙏 Up now bright and early for training and to collect our fresh Forged Stout kegs from my Brewery! What a buzz! I’m gonna start serving breakfast at", numberOfReplies: 22, numberOfRetweets: 68, numberOfLikes: 1152),
  ]
  
  @State private var selectedTab = 1
  var body: some View {
    ZStack{
      TabView(selection: $selectedTab, content: {
        FeedView(tweets: tweets).tabItem { Image( systemName: "house")}.tag(0)
        Text("Buscar").tabItem { Image( systemName: "magnifyingglass") }.tag(1)
        Text("Notificaciones").tabItem { Image( systemName: "bell") }.tag(2)
        Text("mensajes").tabItem { Image( systemName: "envelope") }.tag(3)
      }).accentColor(.twitterBlue)
      VStack{
        Spacer()
        HStack{
          Spacer()
          NewTweetButton()
            .padding(.bottom, 70.0)
            .padding(.trailing)
        }
      }
    }
  }
}

struct FeedView: View{
  let tweets: [Tweet]
  
  var body: some View{
    NavigationView{
      List(tweets){ tweet in
        TweetView(tweet: tweet)
      }
      .listStyle(PlainListStyle())
      .navigationBarTitle("Twitter by ALE", displayMode: .inline)
      .navigationBarItems(
        leading:
          HStack(spacing: 0){
            Button(action: {}) {
              Image(systemName: "person.crop.circle.fill")
                .foregroundColor(.twitterBlue)
            }
            /*Button(action: {}) {
              Image(systemName: "person.crop.circle.fill")
                .foregroundColor(.twitterBlue)
            }*/
          },
        trailing:
            Button(action: {}){
              Image(systemName: "moon.stars")
                .foregroundColor(.twitterBlue)
            }
      )
    }
  }
}

struct NewTweetButton: View{
  var body: some View{
    Button(action: {}){
      Image(systemName: "pencil")
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
    }
    .background(Color.twitterBlue)
    .mask(Circle())
    .shadow(radius: 5)
  }
}

struct TweetView: View{
  let tweet: Tweet
  
  var body: some View{
    HStack(alignment: .top){
      Image(systemName: "person.crop.circle.fill")
        .font(.system(size: 55))
        .padding(.top)
        .padding(.trailing, 5)
        .foregroundColor(.twitterBlue)
      VStack(alignment: .leading){
        HStack{
          Text(tweet.authorName)
            .bold()
            .lineLimit(1)
          Text("@\(tweet.authorUserName) • \(tweet.timestampText)")
            .lineLimit(1)
            .truncationMode(.middle)
            .foregroundColor(.gray)
        }
        .padding(.top, 5)
        Text(tweet.text)
          .lineLimit(nil)
          .multilineTextAlignment(.leading)
        
        TweetActionView(tweet: tweet)
          .foregroundColor(.gray)
          .padding([.bottom, .top], 10)
          .padding(.trailing, 30)
      }
    }
  }
}


struct TweetActionView: View{
  let tweet: Tweet
  
  var body : some View{
    HStack{
      Button(action: {}) {
        Image(systemName: "message")
      }
      Text(tweet.numberOfReplies > 0 ? "\(tweet.numberOfReplies)" : "")
      
      Spacer()
      
      Button(action: {}){
        Image(systemName: "arrow.2.squarepath")
      }
      Text(tweet.numberOfRetweets > 0 ? "\(tweet.numberOfRetweets)" : "")
      
      Spacer()

      Button(action: {}){
        Image(systemName: "heart")
      }
      Text(tweet.numberOfLikes > 0 ? "\(tweet.numberOfLikes)" : "")
      
      Spacer()
      Button(action: {}){
        Image(systemName: "square.and.arrow.up")
      }
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
