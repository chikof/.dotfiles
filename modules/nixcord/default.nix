{ inputs, ... }:
{

  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    dorion.enable = true;
    config = {
      frameless = true;
      plugins = {
        alwaysTrust.enable = true;
        anonymiseFileNames.enable = true;
        betterGifAltText.enable = true;
        betterGifPicker.enable = true;
        betterRoleContext = {
          enable = true;
          roleIconFileFormat = "webp";
        };
        betterSessions.enable = true;
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        clearURLs.enable = true;
        consoleJanitor.enable = true;
        copyEmojiMarkdown.enable = true;
        copyStickerLinks.enable = true;
        crashHandler.enable = true;
        dearrow.enable = true;
        disableCallIdle.enable = true;
        dontRoundMyTimestamps.enable = true;
        expressionCloner.enable = true;
        experiments.enable = true;
        favoriteGifSearch.enable = true;
        fixSpotifyEmbeds = {
          enable = true;
          volume = 8.0;
        };
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        fullUserInChatbox.enable = true;
        gameActivityToggle.enable = true;
        gifPaste.enable = true;
        imageFilename.enable = true;
        imageZoom.enable = true;
        messageClickActions.enable = true;
        messageLinkEmbeds.enable = true;
        messageLogger = {
          enable = true;
          ignoreBots = true;
          ignoreSelf = true;
        };
        messageTags.enable = true;
        moyai = {
          # 🗿
          enable = true;
          volume = 0.2;
        };
        newGuildSettings = {
          enable = true;
          messages = "only@Mentions";
        };
        noDeepLinks.enable = true;
        noDevtoolsWarning.enable = true;
        noF1.enable = true;
        noOnboardingDelay.enable = true;
        noTypingAnimation.enable = true;
        normalizeMessageLinks.enable = true;
        notificationVolume = {
          enable = true;
          notificationVolume = 50.0;
        };
        openInApp.enable = true;
        readAllNotificationsButton.enable = true;
        reverseImageSearch.enable = true;
        sendTimestamps.enable = true;
        shikiCodeblocks = {
          enable = true;
          theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/bcf6dfab46d88c3bae417dcc905840d15fd96683/packages/tm-themes/themes/rose-pine.json";
        };
        showHiddenThings.enable = true;
        spotifyCrack = {
          enable = true;
          noSpotifyAutoPause = true;
          keepSpotifyActivityOnIdle = true;
        };
        stickerPaste.enable = true;
        unlockedAvatarZoom.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        viewRaw.enable = true;
        voiceDownload.enable = true;
        voiceMessages = {
          enable = true;
          noiseSuppression = true;
          echoCancellation = true;
        };
        volumeBooster.enable = true;
        webRichPresence.enable = true;
        webScreenShareFixes.enable = true;
        youtubeAdblock.enable = true;
        noTrack.enable = true;
      };
    };
  };
}
