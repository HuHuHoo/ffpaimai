package org.jmesa.core.preference;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.jmesa.web.WebContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.ResourceUtils;
import org.springframework.util.SystemPropertyUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public final class PropertiesPreferences implements Preferences {
    private static final long serialVersionUID = 1513051402884262753L;

    private final Logger logger = LoggerFactory.getLogger(PropertiesPreferences.class);

    private Properties properties = new Properties();

    public PropertiesPreferences(String location, WebContext webContext) {
        if (location != null) {
            if (!ResourceUtils.isUrl(location)) {
                location = SystemPropertyUtils.resolvePlaceholders(location);
                location = webContext.getRealPath(location);
            }

            logger.debug("Initializing jmesa.properties from [" + location + "]");
            String resolvedLocation = SystemPropertyUtils.resolvePlaceholders(location);
            try {
                File file = ResourceUtils.getFile(resolvedLocation);
                if (!file.exists()) {
                    throw new FileNotFoundException("jmesa config file [" + resolvedLocation + "] not found");
                }
                InputStream input = FileUtils.openInputStream(file);
                if (input != null) {
                    try {
                        properties.load(input);
                    } finally {
                        IOUtils.closeQuietly(input);
                    }
                }
            } catch (FileNotFoundException e) {
                logger.error(e.getMessage(), e);
            } catch (IOException e) {
                logger.error(e.getMessage(), e);
            }
        }

    }

    public String getPreference(String name) {
        return (String) properties.get(name);
    }

    @Override
    public String toString() {
        ToStringBuilder builder = new ToStringBuilder(this);
        builder.append("properties", properties);
        return builder.toString();
    }
}
