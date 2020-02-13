//
//  mapView.swift
//  landmark
//
//  Created by mingyue on 2020/2/10.
//  Copyright © 2020 Gmingyue. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let location = CLLocationCoordinate2D(latitude: 40.0049113988854, longitude: 116.2896180152893)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: location, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
