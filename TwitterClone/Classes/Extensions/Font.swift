//
//  UIFont.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

import SwiftUI

extension Font {
	public static func customBold(size: CGFloat) -> Font{
		return custom("Hellix-Bold", size: size)
	}
	
	public static func customSemiBold(size: CGFloat) -> Font{
		return custom("Hellix-SemiBold", size: size)
	}
	
	public static func customRegular(size: CGFloat) -> Font{
		return custom("Hellix-Regular", size: size)
	}
}
