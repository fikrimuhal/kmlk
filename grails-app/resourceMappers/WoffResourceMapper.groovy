/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 8/1/13
 * Time: 12:10 PM
 *
 * https://gist.github.com/Kallin/2938751
 */
import org.grails.plugin.resource.mapper.MapperPhase

class WoffResourceMapper {

    static phase = MapperPhase.ALTERNATEREPRESENTATION
    static defaultIncludes = [ '**/*.woff' ]

    def map(resource, config) {
        resource.requestProcessors << { req, resp ->
            resp.setHeader('Content-Type', 'font/opentype')
        }
    }

}