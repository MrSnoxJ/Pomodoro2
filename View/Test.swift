//HStack(alignment: .center,spacing: 80, content: {
//    // MARK: - Buttton1 start
//    Button(action: {
//        if self.count == 10{
//            self.count = 0
//            withAnimation(.default){
//                self.to = 0
//            }
//        }
//        self.start.toggle()
//
//    },
//           label: {
//        ZStack (alignment: .center, content:{
//            Circle()
//                .fill(Color.white.opacity(0.3))
//                .frame(width: 56,height: 56)
//            Image(systemName: self.start ? "pause" : "play")
//                .resizable()
//                .scaledToFit()
//                .fontWeight(.semibold)
//                .frame(width: 18.22, height: 20.39)
//                .frame(width: 32,height: 32)
//
//                .foregroundColor(.white)
//
//        }) // MARK: - Zstack button1
//
//    }) // MARK: - Button1
//    // MARK: - Button2 - start
//    Button(action: {
//        self.count = 0
//        withAnimation(.default){
//            self.to = 0
//        }
//    }, label: {
//        ZStack (alignment: .center, content: {
//            Circle()
//                .fill(Color.white.opacity(0.3))
//                .frame(width: 56,height: 56)
//            Image(systemName: "stop.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 16,height: 16)
//                .frame(width: 32,height: 32)
//                .foregroundColor(.white)
//        }) // MARK: - Zstack Button2
//
//    }) // MARK: - Button2
//
//})
