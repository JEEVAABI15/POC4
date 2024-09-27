import jenkins.model.*
import hudson.tools.*

def instance = Jenkins.getInstance()
def nodeJSInstaller = new NodeJSInstaller("node", null)

def nodeJSInstallation = new NodeJSInstallation("node", [nodeJSInstaller], null)
instance.getDescriptorByType(NodeJSInstallation.DescriptorImpl.class).setInstallations(nodeJSInstallation)
instance.save()
