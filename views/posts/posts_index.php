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
                <span class="badge badge-primary">alice
    <span class="badge badge-primary">story</span>
    <span class="badge badge-primary">blog</span>
    <span class="badge badge-primary">personal</span></div>
        </div>
    </div>
    <hr>
<?php endforeach;?>