.PHONY: default info clean build-ui build
default: build ;

APP=WebkitSysmon
UI=webkit-sysmon-ui
VERSION=$(shell /usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" webkit-sysmon/Info.plist)

CMD=set -o pipefail && xcodebuild -workspace webkit-sysmon.xcworkspace -scheme $(APP)


info:
	$(info APP -> $(APP))
	$(info UI  -> $(UI))
	$(info VERSION -> $(VERSION))

clean:
	$(CMD) -configuration Release clean | xcpretty
	rm -f xcodebuild.log
	rm -rf build
	rm -rf $(UI)/build

build-ui:
	cd $(UI) && yarn build

build: clean build-ui
	$(CMD) -configuration Release archive -archivePath "./build/$(APP).xcarchive" | tee xcodebuild.log | xcpretty
	xcodebuild -exportArchive -exportOptionsPlist ExportOptions.plist -archivePath "build/$(APP).xcarchive" -exportPath "build/$(APP)"
	cd build/$(APP) && zip -r ../$(APP)-$(VERSION).zip $(APP).app

test:
	cd $(UI) && yarn test:once
