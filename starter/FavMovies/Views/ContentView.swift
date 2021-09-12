//
//  ContentView.swift
//  ContentView
//
//  Created by Sagun Raj Lage on 12/09/2021.
//  Copyright © 2021 Sagun Raj Lage. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationView {
			Text("My Favorite Movies")
				.navigationTitle("My Favorite Movies")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
