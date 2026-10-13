{ self, ... }: {
  flake.hosts.micolash.system.time = {
    time.timeZone = "${self.userWillowispll.timezone}";
  };
}
