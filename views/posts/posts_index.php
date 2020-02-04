<?php foreach($posts as $post):?>
    <div class="row">
        <a href="<?php echo BASE_URL;?>posts/view/<?php echo $post['post_id'];?>"><h1><?php echo $post['post_subject']?></h1></a>
        <p><?php echo $post['post_text']?></p>
        <div>
            <div>Posted:
                <span class="badge badge-success"><?php echo $post['post_created']?>
    </span>
            </div>
            <div>Tags:
                <?php foreach($tags[$post['post_id']] as $tag):?>
                    <span class="badge badge-primary"><?php echo $tag?></span>
                <?php endforeach;?>
        </div>
    </div>
    <hr>
<?php endforeach;?>