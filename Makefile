APP=WebkitSysmon
WEB=webkit-sysmon-web
VERSION=$(shell /usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" webkit-sysmon/Info.plist)

CMD=set -o pipefail && xcodebuild -workspace webkit-sysmon.xcworkspace -scheme $(APP)

info:
	$(info APP -> $(APP))
	$(info WEB -> $(WEB))
	$(info VERSION -> $(VERSION))

clean:
	$(CMD) -configuration Release clean | xcpretty
	rm -f xcodebuild.log
	rm -rf build
	rm -rf $(WEB)/build

build-web:
	cd $(WEB) && yarn build

build: clean build-web
	$(CMD) -configuration Release archive -archivePath "./build/$(APP).xcarchive" | tee xcodebuild.log | xcpretty
	xcodebuild -exportArchive -exportOptionsPlist ExportOptions.plist -archivePath "build/$(APP).xcarchive" -exportPath "build/$(APP)"
	cd build/$(APP) && zip -r ../$(APP)-$(VERSION).zip $(APP).app

test:
	cd $(WEB) && yarn test:once
