Pod::Spec.new do |spec|

  spec.name         = "ONSExtension"
  spec.version      = "4.0.0"
  spec.summary      = "ONS iOS SDK for Batch App Extensions."
  spec.homepage     = "https://batch.com"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Batch.com" => "support@batch.com" }
  
  spec.platform     = :ios, "12.0"
  spec.swift_version = ['5.0', '5.1', '5.2', '5.3']
  spec.source       = { :git => "https://github.com/tactint/ONS-iOS-SDK-Extension.git", :tag => "#{spec.version}" }

  spec.requires_arc = true
  spec.source_files  = [ "Sources/**/*.{h,m}", "Sources/**/*.swift" ]
  spec.public_header_files = "Sources/**/*.h"
  spec.resource_bundles = {"ONSExtension" => ["Sources/Swift/PrivacyInfo.xcprivacy"]}
end
